class Class
  def attr_checked(name, &block)
    define_method "#{name}=" do |num|
      if block.call(num)        
        instance_variable_set("@#{name}",  num)
      else
        raise "Error"
      end
    end

    define_method name do
        instance_variable_get("@#{name}")
    end    
  end

end

class Cat
  attr_checked :legs do |n|
    n == 4
  end

  attr_checked :age do |n|
    n < 30
  end

end

garfield = Cat.new
garfield.age = 29
garfield.age

garfield.legs = 4
garfield.legs
