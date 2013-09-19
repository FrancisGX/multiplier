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
    attr_reader :correct_answers, :incorrect_answers

    def initialize test
      @correct_answers, @incorrect_answers = test.correct_answers, test.incorrect_answers
    end

    def print
      header
      correct_problems
      incorrect_problems
      return nil
    end

    private

    def header
      puts "---------------- REPORT CARD ---------------"
    end

    def correct_problems
      puts "#{correct_answers.count} CORRECT ANSWERS ".ljust 44, "-"
      format correct_answers
    end

    def incorrect_problems
      puts "#{incorrect_answers.count} INCORRECT ANSWERS ".ljust 44, "-"
      format incorrect_answers
    end

    def format answers
      answers.each_with_index { |a, n| puts "#{n+1}.) #{a}" }
    end
  end
end

