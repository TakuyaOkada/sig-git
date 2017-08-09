require './vending_machine.rb'

puts "Hello"
test_machine = Machine.new([10, 50, 100, 500, 1000].freeze)

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
    test_machine.buy(want)
  else
    coin = input.to_i # 期待されない文字列は0になる 
    test_machine.put_money(coin)
    puts "Total input: #{test_machine.remains}"
    puts "Available: #{test_machine.available_list}"
  end  
end

