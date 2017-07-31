require 'set'
require 'ostruct'

class Machine
  attr_reader :remains, :stock

  # クラスDrinkを作らずに，在庫データを保持する新しいStructを作る． 
  Stock = Struct.new(:name, :price, :num)

  def initialize(remains, usable_money)
    # STEP 1
    @remains, @Usable_money = remains, Set.new(usable_money) 

    # STEP 2
    @stock = Set.new
    @stock << Stock.new("コーラ",120, 5)
    @stock << Stock.new("レッドブル", 200, 4)
  end

  
  # STEP 1
  def can?(money)
    @Usable_money.include?(money)
  end

  def put_money(money)
    @remains += money 
  end
  
  def refund
    puts "refund #{@remains}"
    @remains = 0
  end
  
  # STEP 2
  def add_stock(item, price, num)
    @stock[item] += num
  end
  def reduce_stock(item, price, num)
    @stock[item] -= num
  end
  
  def ls
    @stock.each{|item| p item.name}
  end
end


machine1 = Machine.new(0, [10, 50, 100, 500, 1000].freeze)

p machine1.can?(10)
p machine1.can?(1)
p machine1.put_money(10)
p machine1.put_money(10)
p machine1.put_money(100)

machine1.refund
p machine1.put_money(100)
p machine1.put_money(50)

machine1.ls


