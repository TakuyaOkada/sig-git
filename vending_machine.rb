require 'set'

class Machine
  attr_reader :remains, :stock

  # クラスDrinkを作らない代わりに，在庫データを保持する新しいStruct(商品名，値段，在庫数)を作る
  Stock = Struct.new(:name, :price, :num)

  def initialize(usable_money)
    # STEP 1 (投入金額の残金，扱えるお金)
    @remains = 0
    @Usable_money = Set.new(usable_money) 

    # STEP 2
    # 在庫
    @stock = []
    @stock << Stock.new("コーラ",120, 5)
    @stock << Stock.new("レッドブル", 200, 5)
    @stock << Stock.new("水", 100, 5)

    # STEP 3
    # 売上
    @sales = 0
  end

  
  # STEP 1
  # 使えるお金かどうか真偽
  def can_use?(money)
    @Usable_money.include?(money)
  end

  # 自販機にお金を投入する
  def put_money(money)
    if can_use?(money)
      @remains += money
    else
      puts "NOT usable: #{money}"
      @remains
    end 
  end
  
  # 返金操作を行う
  def refund
    puts "refund #{@remains}"
    @remains = 0
  end
  
  # STEP 2
  # 購入可能な商品リストを返す
  def available_list
    @stock.select{ |item| item.price <= @remains && item.num > 0 }
  end

  # その商品が買えるか真偽
  def can_buy?(want)
    @stock.find_index { |item| item.name == want && item.price <= @remains && item.num > 0 }
  end

  # 商品を購入する
  def buy(want)
    if index = can_buy?(want)
      item = @stock[index]
      item.num -= 1
      @sales += item.price
      @remains -= item.price
      refund
    end
  end

end


machine1 = Machine.new([10, 50, 100, 500, 1000].freeze)

p machine1.can_use?(10)
p machine1.can_use?(1)

p machine1.put_money(10)
p machine1.put_money(10)
p machine1.put_money(5)
p machine1.put_money(500)
machine1.refund

p machine1.put_money(100)
p machine1.put_money(50)

p machine1.stock

puts "購入可能: #{machine1.available_list}"
machine1.buy("水")
p machine1.stock


