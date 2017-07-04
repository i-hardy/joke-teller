require "csv"

def print_menu
  puts "What would you like to do?"
  puts "1. Hear an amazing joke"
  puts "2. Teach me a new joke"
  puts "3. Exit"
end

def process(selection)
  case selection
  when "1"
    joking
  when "2"
    new_joke
  when "3"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def try_get_jokes
  if File.exist?("jokes.csv")
    CSV.foreach("jokes.csv", "r") do |line|
      gag, punchline = line
end

def no_fun
  puts "You're no fun!"
end

def joking
  joke_list = {
  "A broken pencil" => "Never mind, it's pointless",
  "Cows go" => "No, cows go moo",
  "Etch" => "Bless you",
  "Amos" => "A mosquito",
  "Lettuce" => "Lettuce in, it's cold",
  "Beats" => "Beats me"
  }
  joke = joke_list.to_a[rand(joke_list.length)]
  puts "Knock knock"
  response = gets.chomp.downcase
  if response == "who's there?"
    puts joke[0]
    response = gets.chomp.downcase
      if response == "#{joke[0].downcase} who?"
      puts joke[1]
      else
        no_fun
      end
  else
      no_fun
  end
end
