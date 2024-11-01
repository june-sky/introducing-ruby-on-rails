require "byebug"

module A
  def func
    puts "ModuleA#func"
  end
end

module B
  def func
    super
    puts "ModuleB#func"
  end
end

module C
  def func2
    puts "ModuleC#func"
  end
end

puts "========== Class A =========="
class ClassA
  include A
  prepend B

  extend C

  def func
    super
    puts "ClassA#func"
  end
end

# debugger

ClassA.ancestors
# [B, ClassA, A, Object, Kernel, BasicObject]

puts "instance methods"
ClassA.new.func

puts "class method"
ClassA.func2

puts "========== Class B =========="
class ClassB < ClassA
  def func
    super
    puts "ClassB#func"
  end
end
ClassB.new.func
