class MultiplicationTest
  attr_accessor :correct_answers, :incorrect_answers
  attr_reader :number

  def initialize number
    @number = number
    @correct_answers = 0
    @incorrect_answers = 0
  end

  def go
    1..9.times do |x|
      puts "What is #{number} x #{x} ?"
      attempt = gets.chomp.to_i
      answer = number * x

      if attempt == answer
        puts "Correct!"
      else
        puts "False!"
      end
    end
  end
end
