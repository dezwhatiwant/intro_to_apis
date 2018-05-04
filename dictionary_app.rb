require 'unirest'

system "clear"

puts "Fresh Dictionary App"
puts "=" * 30
puts
word = ""

until word == "q"

  print "Enter a word:"
  word = gets.chomp

  response = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=200&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
  puts
  puts "Definition".center(30)
  puts "=" * 30
  p response.body[0]["text"]

  example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&skip=0&limit=5&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
  puts
  puts "Example".center(30)
  puts "=" * 30
  
  p example.body["examples"][0]["text"]

  pronounce = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")

  puts
  puts "Pronounciation".center(30)
  puts "=" * 30
  puts
  p pronounce.body[0]["raw"]

end