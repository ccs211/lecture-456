require 'json'
require 'byebug'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

serialized_beers = File.open(filepath).read
beers_hash = JSON.parse(serialized_beers)

beers = beers_hash["beers"]

puts "What's the name of the beer?"
name = gets.chomp

puts "What's the appeareance of the beer?"
appearance = gets.chomp

puts "What's the origin of the beer?"
origin = gets.chomp

beers << {
  "name" => name,
  "appearance" => appearance,
  "origin" => origin
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers_hash))
end







