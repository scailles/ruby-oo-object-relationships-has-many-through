class Waiter

    attr_accessor :name, :experience
    attr_reader :customer, :meal


    @@all = []

    def initialize(name, experience)
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self,customer, total,tip)
    end

    def new_customer(customer)
        Customer.new(self,meal)
    end


    def meals
        Meal.all.select {|meal| meal.waiter==self}
    end


    def best_tipper
        high_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        high_tip.customer
    end

end