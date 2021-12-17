class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = Array.new()
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else
      false
    end
  end

  def get_matching_indices(char)
    arry = []
    @secret_word.each_char.with_index do |letter, idx|
      arry << idx if letter == char
    end
    arry
  end

  def fill_indices(char, arry)
    arry.each do |idx|
      @guess_word[idx] = char
    end
    @guess_word
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    end
    
    @attempted_chars << char

    arry = self.get_matching_indices(char)
    self.fill_indices(char, arry)

    @remaining_incorrect_guesses -= 1 if arry.empty?

    true
  end

  def ask_user_for_guess
    print "Enter a char:"
    input = gets.chomp
    self.try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  
  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      print @secret_word
      return true
    else
      return false
    end
  end

end