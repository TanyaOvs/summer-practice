# команды для работы с программой
commands = <<-COMMANDS
# D (deposit) - внести деньги
# W (withdraw) - вывести деньги
# B (balance) - проверить баланс
# Q (quit) - выйти из программы
COMMANDS

def deposit
  puts "Введите сумму для внесения:"
  money = gets.chomp.to_f
  if money > 0 && money.is_a?(Float)
    balance_file = File.open("balance.txt")
    new_balance = balance_file.read.to_f + money
    balance_file.close
    File.open("balance.txt", "w") {|f| f.write(new_balance); f.close}
    puts "Сумма #{money} внесена! :)"
  else
    puts "Вы ввели некорректную сумму! Сумма должна быть больше 0."
  end
end

def withdraw
  puts "Введите сумму для снятия:"
  money = gets.chomp.to_f
  balance_file = File.open("balance.txt")
  current_balance = balance_file.read.to_f
  if money > 0 && money.is_a?(Float) && money <= current_balance
    new_balance = current_balance - money
    balance_file.close
    File.open("balance.txt", "w") {|f| f.write(new_balance); f.close}
    puts "Сумма #{money} снята! :)\nВаш текущий баланс: #{new_balance}"
  else
    puts "Вы ввели некорректную сумму! Сумма должна быть больше 0 и меньше (или равна) текущему балансу."
    balance_file.close
  end

end

def balance
  balance_file = File.open("balance.txt")
  current_balance = balance_file.read.to_f
  puts "Ваш текущий баланс составляет: #{current_balance}"
  balance_file.close
end

# базовый капитал на счёте
START_CAPITAL = "100.00"

# если файл не существует, то создаем его и определяем стартовый капитал
unless File.exist?("balance.txt")
  puts "Файл с балансом не существует. Создаем новый файл со стартовым капиталом 100 рублей."
  File.open("balance.txt", "w") {|f| f.write(START_CAPITAL); f.close}
end

puts "Введите команду для работы с балансом:"
puts commands
action = gets.chomp.upcase
while action != "Q"
  if action == "D"
    deposit
  elsif action == "W"
    withdraw
  elsif action == "B"
    balance
  else
    puts "Вы ввели несуществующую команду! Внимательно просмотрите список команд и повторите попытку."
  end

  puts "Введите команду для работы с балансом:"
  puts commands
  action = gets.chomp.upcase
end
puts "Завершение работы программы."