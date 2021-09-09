class Waiter
    attr_reader :name, :experience

    @@all = []
  
    def initialize name, experience
      @name = name
      @experience = experience
      @@all << self
    end
  
    def self.all
      @@all
    end

    def new_meal customer, total, tip
        Meal.new self, customer, total, tip
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tip = meals.max_by {|meal| meal.tip}
        best_tip.customer
    end
end