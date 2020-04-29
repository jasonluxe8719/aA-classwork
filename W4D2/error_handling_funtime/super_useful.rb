# PHASE 2
def convert_to_int(str)
  number = Integer(str)
  
  rescue StandardError
    puts "Unable to conver to int because string is not a number"
    return nil

    #retry
  ensure 
    number.is_a?(Integer)

  number 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError ;end 

class FruitError < StandardError ;end 

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else 
    raise FruitError, "not a fruit i like "
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  # rescue FruitError
  #   return nil
  rescue CoffeeError
    puts  "THANKS, BUT GIVE ME FRUIT"
    retry
end  

class TooSoonError < StandardError ; end
class BlankError < StandardError ; end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

    raise TooSoonError, " It has hasn't been atleast  5 years yet" if yrs_known < 5 
    raise ArgumentError, "years known is not a number" if !yrs_known.is_a?(Integer)
    raise BlankError, "Name and/or favorite pastime is blank" if name.empty? || fav_pastime.empty?

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


