require './vending_machine.rb'

# test
puts "何かいりようかい"
test_machine = Machine.new(0, [10, 50, 100, 500, 1000].freeze)
#STEP0
while true 
  puts "input [coins]/buy/refund/exit"
  input = gets.chomp
  case input
  when "refund"
    test_machine.refund
  when "exit"
    break
  when "buy"
    puts "なににします？"  
    want = gets.chomp
    if test_machine.available?(want)
      test_machine.buy(want)
    end
  else
    coin = input.to_i # 期待されない文字列は0になる
    if test_machine.can?(coin)# STEP 1
      test_machine.put_money(coin)
      puts "投入金額総計: #{test_machine.remains}"
      puts "購入可能: #{test_machine.available_list}"
    else
      puts "釣銭: #{coin}"
    end
  end  
end

