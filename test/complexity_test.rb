require 'minitest/autorun'
require 'rubocop'
require 'open3'
require_relative '../lib/calculator_high_complexity'
require_relative '../lib/calculator_low_complexity'

class ComplexityTest < Minitest::Test
  def setup
    @rubocop = RuboCop::CLI.new
  end

  def test_high_complexity_code
    File.write('temp_high.rb', File.read('lib/calculator_high_complexity.rb'))
    
    stdout, stderr, status = Open3.capture3("rubocop --format json temp_high.rb")
    json_output = JSON.parse(stdout)
    
    complexity_offenses = json_output['files']
      .first['offenses']
      .select { |o| o['cop_name'] == 'Metrics/CyclomaticComplexity' }
    
    refute complexity_offenses.empty?, 
      "High complexity code should trigger complexity warnings"
    
    puts "\nHigh Complexity Score: #{extract_complexity_score(complexity_offenses.first)}"
    
    File.delete('temp_high.rb')
  end

  def test_low_complexity_code
    File.write('temp_low.rb', File.read('lib/calculator_low_complexity.rb'))
    
    stdout, stderr, status = Open3.capture3("rubocop --format json temp_low.rb")
    json_output = JSON.parse(stdout)
    
    complexity_offenses = json_output['files']
      .first['offenses']
      .select { |o| o['cop_name'] == 'Metrics/CyclomaticComplexity' }
    
    assert complexity_offenses.empty?, 
      "Low complexity code should not trigger complexity warnings"
    
    puts "Low Complexity Score: Acceptable (below threshold)"
    
    File.delete('temp_low.rb')
  end

  private

  def extract_complexity_score(offense)
    return 'N/A' unless offense
    offense['message'][/has a cyclomatic complexity of (\d+)/, 1]
  end
end