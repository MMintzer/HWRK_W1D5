require_relative "player.rb"
class Board
  attr_accessor :cups
  VALID_MOVES = [1,2,3,4,5,7,8,9,10,11,12,14]
  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
  end


  def place_stones
    @cups.each_with_index do |cup, idx|
      4.times do cup << :stone unless idx == 6 || idx == 13
      end
    end
  end


  def valid_move?(start_pos)
    raise "Invalid starting cup" unless VALID_MOVES.include?(start_pos)
  end

  def make_move(start_pos, current_player_name)
      cups[start_pos] = []
      stones_in_cup = cups[start_pos].length
      stones_in_cup.times do |x|
        start_pos += 1
        cups[(start_pos % 14)] << :stone
      end
      # render
      # next_turn(start_pos)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if cups[0..5].all? { |cup| cup.empty? }
    return true if cups[7..12].all? { |cup| cup.empty? }
    false
  end

  def winner
    player_1_cup = cup[6].count
    player_2_cup = cup[13].count
    if one_side_empty?
      if player_1_cup > player2_cup
        @name1
      elsif player_2_cup > player_1_cup
          @name2
      else
        "DRAW"
      end
    end
  end
end
