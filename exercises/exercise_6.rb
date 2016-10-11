require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  belongs_to :store
  validates :store, :first_name, :last_name, presence: true
  validates :hourly_rate, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 40,
    less_than_or_equal_to: 200
  }
end

@store1.employees.create(first_name: "Khurram",
  last_name: "Virani",
  hourly_rate: 60)
@store1.employees.create(first_name: "Devin",
  last_name: "Murnane",
  hourly_rate: 60)
@store1.employees.create(first_name: "John",
  last_name: "Chow",
  hourly_rate: 60)
@store1.employees.create(first_name: "Dwigt",
  last_name: "Schrute",
  hourly_rate: 59)
@store2.employees.create(first_name: "Sally",
  last_name: "Fields",
  hourly_rate: 60)
@store2.employees.create(first_name: "Minnie",
  last_name: "Mouse",
  hourly_rate: 60)
