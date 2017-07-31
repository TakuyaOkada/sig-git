require 'set'

class Machine
  attr_accessor :total_putting
  def initialize
    @Usable_money = Set.new [10, 50, 100, 500, 1000].freeze # 名前は expected でもいいかもしれない
    @total_putting = 0
  end

  def usable_money?(money)
    @Usable_money.include?(money)
  end

  def put_money(money)
    @total_putting += money 
  end
  
  def refund
    puts "output #{@total_putting}"
    @total_putting = 0
  end
end


machine1 = Machine.new

p machine1.usable_money?(10)
p machine1.usable_money?(1)
p machine1.put_money(10)
p machine1.put_money(10)
p machine1.put_money(100)


