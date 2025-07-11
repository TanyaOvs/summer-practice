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
  end
end

# базовый капитал на счёте
START_CAPITAL = "100.00"

# если файл не существует, то создаем его и определяем стартовый капитал
unless File.exist?("balance.txt")
  puts "Файл с балансом не существует. Создаем новый файл со стартовым капиталом 100 рублей."
  new_balance_file = File.open("balance.txt", "w").write(START_CAPITAL)
  new_balance_file.close
end

puts "Введите команду для работы с балансом:"
puts commands
action = gets.chomp.upcase
while action != "Q"
  if action == "D"
    deposit
  elsif action == "W"
    break
  elsif action == "B"
    break
  else
    puts "Вы ввели несуществующую команду! Внимательно просмотрите список команд и повторите попытку."
  end
  action = gets.chomp.upcase
end
