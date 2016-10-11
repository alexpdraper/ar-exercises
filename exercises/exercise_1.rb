require_relative '../setup'

puts "Exercise 1"
puts "----------"

# Your code goes below here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: {minimum: 3}
  validates :annual_revenue, presence: true, numericality: {only_integer: true}
  validate :must_sell_mens_or_womens_apparel

  private
    def must_sell_mens_or_womens_apparel
      if !mens_apparel && !womens_apparel
        errors.add(:mens_apparel, 'At least one of men\'s apparel or women\'s' +
        ' apparel must be true')
        errors.add(:womens_apparel, 'At least one of men\'s apparel or women\'s' +
        ' apparel must be true')
      end
    end

    before_destroy {false if self.employees.count > 0}
end

Store.create(name: 'Burnaby',
  annual_revenue: 300_000,
  mens_apparel: true,
  womens_apparel: true)

Store.create(name: 'Richmond',
  annual_revenue: 1_260_000,
  mens_apparel: false,
  womens_apparel: true)

Store.create(name: 'Gastown',
  annual_revenue: 190_000,
  mens_apparel: true,
  womens_apparel: false)

puts Store.count
