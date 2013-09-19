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
        correct x, answer
      else
        incorrect x, attempt
      end
    end
  end

  def correct x, answer
    puts "Correct!"
    correct_answers << "#{number} x #{x} = #{answer}"
  end

  def incorrect x, attempt
    puts "Incorrect!"
    incorrect_answers << "#{number} x #{x} != #{attempt}"
  end

  def report
    Report.new(self).print
  end

  class Report
    attr_reader :test

    def initialize test
      @test = test
    end

    def print
      puts "---------------- REPORT CARD ---------------"
      puts "#{test.correct_answers.count} CORRECT ANSWERS"
      puts "#{test.incorrect_answers.count} INCORRECT ANSWERS"
      puts "--------------------------------------------"
      puts "Correct Answers:"
      test.correct_answers.each_with_index { |a, n| puts "#{n+1}.) #{a}" }

      puts "Incorrect Answers:"
      test.incorrect_answers.each_with_index { |a, n| puts "#{n+1}.) #{a}" }

      return nil
    end
  end
end

