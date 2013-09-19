class MultiplicationTest
  attr_accessor :correct_answers, :incorrect_answers
  attr_reader :number

  def initialize number
    @number = number
    @correct_answers = []
    @incorrect_answers = []
  end

  def start
    1..9.times do |x|
      puts "What is #{number} x #{x} ?"
      attempt = gets.chomp.to_i
      answer = number * x

      if attempt == answer
        puts "Correct!"
        correct_answers << "#{number} x #{x} = #{answer}"
      else
        puts "False!"
        incorrect_answers << "#{number} x #{x} != #{attempt}"
      end
    end
  end
end
