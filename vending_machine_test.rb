require './vending_machine.rb'

# test
puts "Test Start"
test_machine = Machine.new(0, [10, 50, 100, 500, 1000].freeze)
#STEP0
while true 
  puts "input [coins]/refund/exit"
  input = gets.chomp
  case input
  when "refund"
    test_machine.refund
  when "exit"
    break
  else
    coin = input.to_i
    if test_machine.can?(coin)# STEP2
      test_machine.put_money(coin)
      puts "投入金額総計: #{test_machine.remains}"
    else
      puts "釣銭: #{coin}"
    end
  end  
end

