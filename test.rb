require 'minitest/autorun'
require 'flog'

class ComplexityTest < Minitest::Test
  def test_cyclomatic_complexity
    good_complexity = Flog.new.flog_method('good_complexity.rb')
    bad_complexity = Flog.new.flog_method('bad_complexity.rb')

    puts "Good complexity score: #{good_complexity}"
    puts "Bad complexity score: #{bad_complexity}"

    assert good_complexity < bad_complexity, "Good complexity should be lower than bad complexity"
  end
end