
require 'csv'
require 'byebug'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'

csv_options = {
  col_sep: ",",
  quote_char: '"',
  headers: :first_row,
  header_converters: :symbol
}

beers = []
CSV.foreach(filepath, csv_options) do |row|
  beers << {
    name: row[:name],
    appearance: row[:appearance],
    origin: row[:origin]
  }
end

puts "What's the name of the beer?"
name = gets.chomp

puts "What's the appeareance of the beer?"
appearance = gets.chomp

puts "What's the origin of the beer?"
origin = gets.chomp

beers << {
  name: name,
  appearance: appearance,
  origin: origin
}

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << %w[Name Appearance Origin]
  beers.each do |beer|
    # beer is a Hash
    csv << beer.values
  end
end













