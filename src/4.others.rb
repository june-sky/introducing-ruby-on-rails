arr = [1, 2, 3]
def arr.name
  puts "arr:#{join("-")}"
end
puts arr.name

puts "========== monkey patch =========="
class Monkey
  def speak
    puts "Speak: Ha ha ha ha ..."
  end
end
monkey1 = Monkey.new
monkey1.speak

class Monkey
  def speak
    puts "Speak: wang wang wang ..."
  end
end
monkey1.speak
monkey2 = Monkey.new
monkey2.speak

puts "========== method_missing =========="
class A
  def method_missing(method_name, *args, &block)
    if method_name.start_with?("sky_")
      puts "Called: #{method_name} with arguments: #{args.join(", ")}"
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    # 检查是否可以响应该方法
    # 这里可以根据需要修改，例如：

    method_name.start_with?("sky_") || super
  end
end
object = A.new
puts object.respond_to?(:sky_func)
object.sky_func(1, 2)
puts object.respond_to?(:func)
# object.func(1, 2)
