require 'saikuro'

def calculate_complexity(file_name)
  code = File.read(file_name)
  complexity = Saikuro.calculate_cyclomatic_complexity(code)
  puts "Complexidade do #{file_name}: #{complexity}"
  complexity
end

puts "Teste de complexidade:"
good_complexity = calculate_complexity('good.rb')
bad_complexity = calculate_complexity('bad.rb')