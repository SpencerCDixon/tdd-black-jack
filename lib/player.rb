require_relative 'person'

class Player < Person
  def initialize(name)
    super(name)
  end

  def get_choice
    print "Stay or hit? (S/H): "
    choice = gets.chomp.downcase
    ["s","h"].include?(choice) ? choice : get_choice
  end

  def play_again?
    print "Play another round? (Y/N): "
    choice = gets.chomp.downcase
    ["y","n"].include?(choice) ? choice : play_again?
  end
end
