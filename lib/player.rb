class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

  def get_coordinates
    print "Which row: "
    row = gets.chomp.to_i
    print "Which columns: "
    column = gets.chomp.to_i

    [row, column]
  end
end
