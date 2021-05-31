class Hangman
  def initialize
    @word = words.sample
    @try = 3
    @correct_guess = []
    @teaser = ''
    @word.first.size.times do
      @teaser += '_ '
    end
  end

  def words
    [
      ['Lucky', "It's my Nickname"],
      ['Patra', "It's my Name"],
      ['Vagyasri', "It's my Prename"],
      ['Coding', "That's what I like to do.."],
      ['Microverse', "It's where from I learn"]
    ]
  end

  def word_teaser(last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    puts @teaser
  end

  def update_teaser(last_guess)
    new_teaser = @teaser.split

    new_teaser.each_with_index do |letter, index|
      new_teaser[index] = last_guess if letter == '_' && @word.first[index] == last_guess
    end

    @teaser = new_teaser.join(' ')
  end

  def guess_word
    print "\nEnter a letter:"
    guess = gets.chomp
    good_guess = @word.first.include? guess
    if guess == 'exit'
      puts 'Thank you for playing!'
    elsif guess.length > 1
      puts 'only guess 1 letter at a time please!'
      guess_word
    elsif good_guess
      puts "\nGood guess"

      word_teaser guess
      if @word.first == @teaser.split.join
        puts "\nCongratulations! You won!!"
      else
        guess_word
      end

    elsif @try == 1
      puts "\n Oops!! GAME OVER !! Better luck next time."
    else
      @try -= 1
      puts "\nBad Guess!!\n#{@try} tries left..Try again"
      guess_word
    end
  end

  def begin
    puts "\nLet's get started.. \n\nYour word is #{@word.first.size} character long (Clue: #{@word.last})"
    puts "To exit game at any point type 'exit'"
    word_teaser
    puts ''
    guess_word
  end
end

game = Hangman.new
game.begin
