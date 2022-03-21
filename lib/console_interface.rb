class ConsoleInterface
  FIGURES = Dir["#{__dir__}/../data/figures/*.txt"].sort.map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~PRINT
      Слово: #{word_to_show}
      #{figure}
      Ошибки: (#{@game.errors_made}): #{errors_to_show}
      У Вас осталось ошибок: #{@game.errors_allowed}
    PRINT

    if @game.won?
      puts "Поздравляем, Вы выиграли!"
    else
      puts "Вы проиграли, загаданное слово: #{@game.word}"
    end
  end

  def figure
    FIGURES[@game.errors_made]
  end

  def word_to_show
    @game.letters_to_guess.map { |letter| letter || "__" }.join(" ")
  end

  def errors_to_show
    @game.errors.join(", ")
  end

  def get_input
    print "Введите следующую букву: "
    gets[0].upcase
  end
end
