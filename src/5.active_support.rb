require "active_support/all"

puts 3.days.ago

puts false.blank?
puts nil.blank?
puts {}.blank?

puts false.present?
puts nil.present?
puts {}.present?

object = {c: 3, b: 2, a: 1}
puts object.with_indifferent_access["a"]
puts object.to_query # => "a=1&b=2&c=3"
puts 3.in? [1, 2]
puts [1, 2].include?(3)
# others: index_by, index_with, pluck, pick, etc

module MyConcern
  extend ActiveSupport::Concern

  def func1
    puts "instance method func1"
  end

  class_methods do
    def foo
      puts "foo"
    end

    private

    def bar
      puts "bar"
    end
  end
end

class MyClass
  include MyConcern
end

MyClass.new.func1

MyClass.foo # => "foo"
# MyClass.bar # => private method 'bar' called for Buzz:Class(NoMethodError)
