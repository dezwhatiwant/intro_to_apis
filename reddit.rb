require 'unirest'

system "clear"

puts "Reddit App".center(30)
puts "=" * 30
puts
puts "Input Subreddit:"

sub_r = gets.chomp
puts "=" * 30

response = Unirest.get("https://www.reddit.com/r/#{sub_r}/.json")

puts "Top Posts".center(30)
puts "=" * 30
index = 2


# 10.times do 
posts = response.body
# index += 1
# puts 
# p posts

posts.each_with_index do |post, index|
    puts "#{index + 1} - #{posts["data"]["children"][index]["data"]["title"]}"
    puts
end
