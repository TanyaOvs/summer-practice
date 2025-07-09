def createHash
  puts "Enter the name of pockemon:"
  name = gets.chomp
  puts "Enter the color of pockemon:"
  color = gets.chomp
  return {"name": name, "color": color}
end

def createMassiveOfPockemons
  puts "Input number of pockemons:"
  numOfPockemons = gets.chomp.to_i
  if numOfPockemons <= 0
    return "Please, enter correct amount of pockemons!"
  end
  result = []
  for i in 1..numOfPockemons
    currentPockemon = createHash
    result << currentPockemon
  end
  return result
end

p createMassiveOfPockemons