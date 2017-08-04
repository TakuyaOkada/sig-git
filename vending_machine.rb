require 'set'

class Machine
  attr_reader :remains, :stock

  # クラスDrinkを作らずに，在庫データを保持する新しいStructを作る． 
  Stock = Struct.new(:name, :price, :num)

  def initialize(remains, usable_money)
    # STEP 1 投入金額の残金，扱えるお金
    @remains, @Usable_money = remains, Set.new(usable_money) 

    # STEP 2
    # 在庫
    @stock = Set.new
    @stock << Stock.new("コーラ",120, 5)
    @stock << Stock.new("レッドブル", 200, 5)
    @stock << Stock.new("水", 100, 5)

    # STEP 3
    # 売上
    @sales = 0
    
    # STEP 4
    # 購入可能な商品を保持する集合
    @available_list = Set.new
  end

  
  # STEP 1
  # 使えるお金かどうか真偽
  def can?(money)
    @Usable_money.include?(money)
  end

  # 自販機にお金を投入する
  def put_money(money)
    @remains += money 
  end
  
  # 返金操作を行う
  def refund
    puts "refund #{@remains}"
    @remains = 0
  end
  
  # STEP 2
  # 購入可能な商品の集合を「人間が読みやすい形に表現して(inspect)」返す
  def available_list
    @stock.each{|item| if item.price <= @remains && item.num > 0; @available_list << item.name;end  }
    return @available_list.inspect
  end

  # ある商品が購入可能か調べる
  def available?(item)
    return @available_list.include?(item)
  end

  # 商品を購入する
  def buy(want)
    @stock.each do |item| 
      if item.name == want
        item.num -= 1
        @sales += item.price
        return @remains -= item.price
      end
    end
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

p machine1.stock 

puts "購入可能: #{machine1.available_list}"
p machine1.available?("水")
machine1.buy("水")
machine1.refund
p machine1.stock


