# index - выводит все строки файла
# find(id) - находит конкретную строку в файле и выводит её
# where(pattern) - находит все строки, где есть указанный паттерн

def index(file_name)
  file = File.open(file_name, 'r')
  File.foreach(file_name) do |line| puts line end
  file.close
end

def find(file_name, id)
  file = File.open(file_name, 'r')
  File.foreach(file_name).with_index do |line, index|
    if id == index
      puts line
    end
  end
  file.close
end

def where(file_name, pattern)
  file = File.open(file_name, 'r')
  found_lines = []
  File.foreach(file_name).each do |line|
    if line.include?(pattern)
      found_lines << line
      puts line
    end
  end
  file.close
end

FILE_NAME = "test.txt"
# 1
index(FILE_NAME)

#2
puts"Введите индекс строки для вывода: "
str_id = gets.chomp.to_i
find(FILE_NAME, str_id)

#3
puts"Введите паттерн для поиска строк: "
str_pattern = gets.chomp
where(FILE_NAME, str_pattern)