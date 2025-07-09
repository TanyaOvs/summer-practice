input_string = gets.chomp
temp_string = input_string.upcase
if temp_string.rindex("CS") == temp_string.size - 2
  puts 2 ** temp_string.size
else
  puts input_string.reverse
end

