puts "hello world"

def hello(name)
  puts "hello #{name}"
end
hello("alex")
hello("sky")

puts "===arr==="
arr = (1..3).to_a.map { |item| [item, item**2] }
puts "arr: #{arr}"
puts "size: #{arr.size}"
arr.map(&:to_s).each do |item|
  puts item
end
arr.each_with_index do |item, index|
  puts "#{index}: #{item}"
end

puts "===hash==="
hash = {a: 1, b: 2, c: 3}
puts "Size: #{hash.size}"
puts "keys: #{hash.keys}"
puts "values: #{hash.values}"
hash.each do |key, value|
  puts "#{key}: #{value}"
end

puts "===fab==="
def fab(num)
  (num < 2) ? 1 : (fab(num - 1) + fab(num - 2))
end
10.times do |index|
  puts "#{index}: #{fab(index)}"
end

puts "===== class ====="
class A
  def func1
    puts "A#func1"
  end

  def self.func3
    puts "A.func3"
  end

  private

  def func2
    puts "A#func2"
  end

  class << self
    def func4
      puts "A.func4"
    end

    private

    def func5
      puts "A.func5"
    end
  end
end
A.new.func1
# puts A.new.func2
A.func3
A.func4
# puts A.func5

puts "========= exception ========="

def func1
  puts "---------- test func1 ----------"
  begin
    yield if block_given?
    puts "success"
  rescue => e
    puts "Receive #{e.class}, #{e}"
  ensure
    puts "Final block"
  end
end
func1
func1 { "a" + 1 }
