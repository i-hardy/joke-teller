require "csv"
@jokes = []

def print_menu
  sleep 1
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
      @gag, @punchline = line
      create_joke_array
    end
    puts "I know #{@jokes.count} amazing jokes!"
  else
    puts "I don't know any jokes :("
  end
end

def create_joke_array
  @jokes << {gag: @gag, punchline: @punchline}
end

def new_joke
  puts "Okay, so you say \"Knock knock\", I say \"Who's there?\", and then you say..."
  @gag = STDIN.gets.chomp.capitalize
  puts "And I say \"#{@gag} who?\"..."
  @punchline = STDIN.gets.chomp.capitalize
  @jokes << {gag: @gag, punchline: @punchline}
  puts "Haha! I'll remember that one!"
  save_jokes
end

def save_jokes
  CSV.open("jokes.csv", "w") do |csv|
    @jokes.each do |joke|
      csv << [joke[:gag], joke[:punchline]]
    end
  end
end

def no_fun
  puts "You're no fun!"
end

def joking
  joke = @jokes[rand(@jokes.length)]
  puts "Knock knock"
  response = gets.chomp.downcase
  if response == "who's there?"
    puts joke[:gag]
    response = gets.chomp.downcase
      if response == "#{joke[:gag].downcase} who?"
      puts joke[:punchline]
      else
        no_fun
      end
  else
      no_fun
  end
end

try_get_jokes
interactive_menu
