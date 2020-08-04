require 'open-uri'
require 'nokogiri'
require 'byebug'

# Let's scrape recipes from https://www.last.fm/music

BASE_URL = "https://www.last.fm/music/"

puts "What artist do you want to search?"
artist = gets.chomp

url = BASE_URL + artist.gsub(" ", "+")
html_content = open(url).read
html_document = Nokogiri::HTML.parse(html_content)

tracks = []
html_document.search('#top-tracks tr.chartlist-row td[itemprop="name"]').each do |element|
  tracks << element.text.strip
end

puts "#{artist}'s Top Tracks:"
tracks.each_with_index do |track, index|
  puts "#{index + 1} - #{track}"
end






