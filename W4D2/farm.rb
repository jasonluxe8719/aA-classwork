# public methods: 
#   explicit receiver? yes ( use self.#)
#   implicit receiver? yes 

# private methods:
#   explicit receiver? no (execept for attr_writer)
#   implicit receiver? yes 
    
#protected methods: 
#   explicit receiever? yes, but only within the class definition 
#       or any children classes 
#   implicit receiver? yes 

require 'singleton'


class BrokenLegError < StandardError ; end 

module MyEnumerable 
    def my_each 
        raise MyError, "Fix me!!!!!!"
    end

    def my_any?(&blk)
        self.my_each do |el|
            return true if blk.call(el)
        end 
        false
    end 


end 


class Farm
    # include Enumerable # all methods added by Enumberable rely upon the extend
    include MyEnumerable


    def initialize(animals)
        @animals = animals 
    end 

    def my_each(&blk)
        @animals.each(&blk)
    end 

end 

class Animal 
    attr_reader :name, :pos , :movement, :noise

    def initialize(name, pos)
        @name = name 
        @pos = pos 
        @movement = 'moves'
        @noise = 'noises'
    end 

    def move(distance)
        new_pos = pos + distance
        puts "#{name} #{movement} from #{pos} to #{new_pos}"
        self.pos = new_pos 
    end 

    def make_noise
        puts "#{name} #{noise}!"
    end 

    private 
    attr_writer :pos


end 


class Horse < Animal

    def initialize ( name , pos )
        super
        @movement = 'gallops'
        @noise = 'neighs'
        @broken_leg = false
    end 

    def rename(new_name)
        # invoked a private method with an explicit receiver...
        self.name = new_name if new_name.length > 10 
        #updates name

        # name = new_name if new_name.length > 10
        #does not update name 
        # is this local variable? no 
        # you must be creating a new local variable then
    end 

    def move(distance, adverb = '')
        raise BrokenLegError if @broken_leg 
        print adverb
        super(distance)
    end 

    def break_leg 
        @broken_leg = true
        puts "didn't see that hole coming"
    end

    def heal_leg
        @broken_leg = false 
        puts "thank goodness for medicine"
    end 

    def what_is_test 
        test
    end 

    def greet(animal)
        puts "#{name} greets #{animal.name}"
    end

    # protected 
    # attr_reader :name

    private 
    attr_writer :name, :pos

end


class Dog < Animal

    def initialize ( name , pos )
        super
        @movement = 'runs'
        @noise = 'bark'
    end 

    def greet(animal)
        puts "#{name} greets #{animal.name}"
    end

    # protected 
    # attr_reader :name
end


class NullAnimal < Animal
    include Singleton

    def initialize(name = '', pos = '' )
        super 
        @movement = '' 
        @noise = '' 
    end 

    def make_noise
    end


end 




if $PROGRAM_NAME == __FILE__ 
    boxer = Horse.new('Boxer', 0)
    clover = Horse.new('Clover', 2)
    jessie = Dog.new('Jessie', 3)

    # bob.gallop(5)
    # bob.neighs 

    # p bob.name
    # bob.rename('JoeJoeJoeJoeJoe')
    # p bob.name


    # p bob.what_is_test

    # clover.greet(jessie)

    stable = Array.new(10) {NullAnimal.instance}
    #NullAnimal has same interface as an Animal
    stable[0] = boxer 
    stable[1] = clover 
    stable[7] = jessie 

    my_farm = Farm.new(stable)
    # my_farm.my_each(&:make_noise)

    # p my_farm.my_any? {|animal| animal.name == 'Joe'}

    # p Horse.ancestors
    # bob.move(3, 'With haste ')
    # jessie.move(4)

    # p Farm.instance_methods

    boxer.break_leg 
    begin
        boxer.move(5, "Laziliy, ")
    rescue BrokenLegError => err
        boxer.heal_leg
        retry
    # else 

    ensure 
        boxer.make_noise
    end 
end 