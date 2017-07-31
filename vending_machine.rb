require 'set'

class Machine
  def initialize
    @Usable_money = Set.new [10, 50, 100, 500, 1000].freeze
    @total_putting = 0
  end

  def usable_money?(money)
    @Usable_money.include?(money)
  end

  def put_money(money)
    @total_putting += money 
  end
end


machine1 = Machine.new
p machine1.usable_money?(10)
p machine1.usable_money?(1)
p machine1.put_money(10)
