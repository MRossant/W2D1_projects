require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    # chars.each {|char| return false if !POSSIBLE_PEGS.include?(char.upcase)}
    chars.all? {|char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  attr_reader :pegs

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Pegs not valid"
    end
  end

  def self.random(length)
    random_pegs = Array.new(length)
    random_pegs.each.with_index {|peg, i| random_pegs[i] = POSSIBLE_PEGS.keys.sample}
    # POSSIBLE_PEGS.keys.sample
    Code.new(random_pegs)
  end

  def self.from_string(string_pegs)
    Code.new(string_pegs.chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count {|i| guess.pegs[i] == @pegs[i]}
  end

  def num_near_matches(guess_code)
    self_dup = self.pegs.dup
    guess_dup = guess_code.pegs.dup

    guess_dup.each_with_index do |peg, i|
      if peg == self_dup[i]
        self_dup[i] = nil
        guess_dup[i] = nil
      end
    end
    self_dup.delete(nil)
    guess_dup.delete(nil)

    count = 0
    guess_dup.each_with_index do |peg, i|
      if self_dup.include?(peg)
        count += 1
        self_dup.delete_at(self_dup.index(peg))
      end
    end 
    count 
  end

  def ==(other_code)
    self.pegs == other_code.pegs && self.length == other_code.length
  end
end
