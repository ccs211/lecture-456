require 'open-uri'
require 'json'
require 'byebug'

# TODO - Let's fetch name and bio from a given GitHub username


BASE_URL = "https://api.github.com/users/"

puts "What's your GitHub username?"
username = gets.chomp
url = BASE_URL + username

serialized_user = open(url).read
user = JSON.parse(serialized_user)

puts "#{username}, you have #{user["public_repos"]} public repositories."
