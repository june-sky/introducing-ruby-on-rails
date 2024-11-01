def func1(a, b = 10)
  puts a + b
end

def func2(a, *b)
  puts "(a: #{a}, b: #{b})"
end

def func3(a:, b: 22, c: 333)
  puts "a: #{a}, b: #{b}, c: #{c}"
end

def func4(a, **b)
  puts "a: #{a}, b: #{b}"
end

def func5(a, &block)
  puts "a: #{a}, block: #{block&.call(a)}"
end

def func6(a)
  puts "a: #{a}, block: #{yield a if block_given?}"
end

def func7(score)
  if score >= 95
    "A"
  elsif score >= 80
    "B"
  elsif score >= 60
    "C"
  else
    "D"
  end
end

def func8(value)
  case value
  when "hello"
    "is hello"
  when String, Integer
    "is string or integer"
  when true, false
    "is boolean"
  else
    "unsupported"
  end
end

def test
  func1(1, 2)
  func1(1)

  func2(1)
  func2(1, 2, 3)
  func2(1, 2, 3, 4)

  func3(a: 1)
  func3(a: 1, b: 2)
  func3(a: 1, b: 2, c: 3)

  func4(1)
  func4(1, a: 1, b: 2)
  func4(1, a: 1, b: 2, c: 3)

  puts "block"
  func5(3)
  # block
  func5(3) { |item| item**2 }
  # lambda: 严格检查参数的数量
  block = ->(item) { item**2 }
  func5(4, &block)
  # Proc, Proc.new { |item| item**2 }, 不会严格检查参数的数量
  block = proc { |item| item**2 }
  func5(5, &block)

  puts "yield"
  func6(3)
  # block
  func6(3) { |item| item**2 }
  # lambda: 严格检查参数的数量
  block = ->(item) { item**2 }
  func6(4, &block)
  # Proc, Proc.new { |item| item**2 }, 不会严格检查参数的数量
  block = proc { |item| item**2 }
  func6(5, &block)

  puts "======== if ... else ... ========"
  [99, 88, 77, 55].each do |score|
    puts "#{score} is #{func7(score)}"
  end

  puts "======== case ... when ... ========"
  ["hello", 88, "fdafd", true, [1, 2, 3]].each do |item|
    puts "#{item} is #{func8(item)}"
  end
end

test
