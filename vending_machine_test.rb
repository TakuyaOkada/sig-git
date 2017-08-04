require './vending_machine.rb'

puts "Hello"
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
    puts "What do you want?"  
    want = gets.chomp
    if test_machine.available?(want)
      test_machine.buy(want)
      puts "You got #{want}!"
      test_machine.refund
    end
  else
    coin = input.to_i # 期待されない文字列は0になる
    if test_machine.can?(coin)# STEP 1
      test_machine.put_money(coin)
      puts "Total input: #{test_machine.remains}"
      puts "Available: #{test_machine.available_list}"
    else
      puts "refund: #{coin}" #扱えないお金
    end
  end  
end

