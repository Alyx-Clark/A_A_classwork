class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    pegs = POSSIBLE_PEGS.keys
    chars.each do |char|
      return false if !pegs.include?(char.upcase)
    end
    true
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "invalid pegs!"
    else
      @pegs = pegs.map! {|ele| ele.upcase}
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    arry = []
    peg_arry = POSSIBLE_PEGS.keys
    (1..length).each do |i|
      arry << peg_arry.sample
    end
    Code.new(arry)
  end

  def self.from_string(str_pegs)
    arry = str_pegs.split("")
    Code.new(arry)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    exact_match = 0
    (0...code.length).each do |i|
      exact_match += 1 if code[i] == @pegs[i]
    end
    exact_match
  end

  def num_near_matches(guess_code)
    code_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == code_dup[i]
        code_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    code_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if code_dup.include?(peg)
        count += 1
        code_dup.delete_at(code_dup.index(peg))
      end
    end
    count
  end

  def ==(code)
    self.num_exact_matches(code) == code.length
  end
end
