# class Classname

#   def initialize(att)
#     @attr = att
#   end

#   def varying_method
#   end

#   def common_method
#   end


# end

# class Sub1 < Classname
#   def varying_method
#     puts 'overwrite'
#   end
# end

# class Sub2 < Classname
#   def varying_method
#     puts 'overwrite'
#   end
# end

# class Sub3 < Classname
#   def varying_method
#     puts 'overwrite similar to sub1 but have to rewrite algorithm'
#   end
# end

class Crocodile

  attr_reader :length, :weight

  def initialize(length, weight)
    @length = length
    @weight = weight
  end

  def chomp
    puts 'the Crocodile, being a carnivore, chomps on some meat'
  end

  def float
    puts 'the Crocodile floats ominously'
  end

end

class SaltWaterCrocodile < Crocodile
end

class FakeCrocodile < Crocodile
  def chomp
    puts "The rubber crocodile doesn't do anything"
  end
end

class VegetarianCrocodile < Crocodile
  def chomp
    puts "The veggie crocodile eats a caesar salad"
  end
end