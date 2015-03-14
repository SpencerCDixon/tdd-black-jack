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
end
