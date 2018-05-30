require_relative "player.rb"
class Board
  attr_accessor :cups
  VALID_MOVES = [1,2,3,4,5,7,8,9,10,11,12,14]
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones

  end


  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do cup << :stone
      end
    end
  end


  def valid_move?(start_pos)
    raise "Invalid starting cup" unless VALID_MOVES.include?(start_pos)
    raise "Invalid starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []


    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
    ending_cup_idx
    end
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
    player1_count = @cups[6].count
    player2_count = @cups[13].count

    if player1_count == player2_count
      :draw
    else
      player1_count > player2_count ? @name1 : @name2
    end
  end
end