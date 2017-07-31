require './vending_machine.rb'

# test
puts "Test Start"
test_machine = Machine.new
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
    test_machine.put_money(input.to_i)
    puts test_machine.total_putting
  end  
end

