# class ClassName

#   def initialize(att, behavior)
#     @attr = att
#     @behavior = behavior
#   end

#   def common_method
#   end

#   def varying_method
#     @behavior.varying_method(self)
#   end

# end


# # class Algorithms
# #   def varying_method(context)
# #     raise 'Abstract method called'
# #   end
# # end


# class Algo1 
#   def varying_method(context)
#     puts 'The #{context.class} does a specific behavior'
#   end
# end

# class Algo2 
#   def varying_method(context)
#     puts 'The #{context.class} does a different specific behavior'
#   end
# end




class Crocodile

  def initialize(length, weight, diet_behavior)
    @length = length
    @weight = weight
    @diet_behavior = diet_behavior
  end

  def float
    puts 'the crocodile floats ominously'
  end

  def chomp
    @diet_behavior.chomp(self)
  end

end

class SaltwaterCrocodile < Crocodile

end



class VeggieDiet
  def chomp(context)
    puts "The #{context.class} chomps on a caesar salad"
  end
end

class NoDiet 
  def chomp(context)
    puts "The #{context.class} doesn't eat"
  end
end

class CarnivoreDiet 
  def chomp(context)
    puts "The #{context.class} chomps on some meat"
  end
end


croc = SaltwaterCrocodile.new(20, 300, CarnivoreDiet.new)
croc.chomp