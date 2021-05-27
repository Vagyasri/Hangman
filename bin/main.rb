class Hangman
  def initialize
    @letter = ('a'..'z').to_a
    @word = words.sample
    @try = 3
    @correct_guess = []
  end

  def words
    [
      ['Lucky', "It's my Nickname"],
      ['Patra', "It's my Name"],
      ['Vagyasri', "C'est mon Prenom"],
      ['Coding', "That's what I like to do.."],
      ['Microverse', "It's where from I learn"]
    ]
  end

  def word_teaser
    teaser = ''
    @word.first.size.times do
      teaser += '_ '
    end
    puts teaser
  end

  def guess_word
    print "\nEnter a letter:"
    guess = gets.chomp
    good_guess = @word.first.include? guess
        
            if good_guess
                    puts "\nGood guess"
                    print @correct_guess << guess
                    @letter.delete guess
                    word_teaser
                    guess_word 


            else
                unless @try == 1
                @try -= 1
                puts "\nBad Guess!!\n#{@try} tries left..Try again"
                guess_word
                else
                puts "\n Oops!! GAME OVER !!"
                end
            end    
  end

  def begin
    puts "\nLet's get started.. \n\nYour word is #{@word.first.size} character long (Clue: #{@word.last})"
    word_teaser
    puts ''
    guess_word
  end
end

game = Hangman.new
game.begin
