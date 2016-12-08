class Crocodile

  def initialize(length, weight, &diet_behavior)
    @length = length
    @weight = weight
    @diet_behavior = diet_behavior
  end

  def float
    puts 'the crocodile floats ominously'
  end

  def chomp
    @diet_behavior.call(self)
  end

end

class SaltwaterCrocodile < Crocodile
end



VEGGIE_DIET =  Proc.new {|context| puts "The #{context.class} chomps on a caesar salad"}
NO_DIET =  Proc.new {|context| puts "The #{context.class} doesn't eat"}
CARNIVORE_DIET =  Proc.new {|context| puts "The #{context.class} chomps on some meat"}
 

croc = SaltwaterCrocodile.new(20, 300, &VEGGIE_DIET)
croc.chomp