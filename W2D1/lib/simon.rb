class Simon
  # COLORS = %w(r b g y)
  COLORS = %w(red blue yellow green)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1, game_over = false, seq = [])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq = []
  end

  def play
    until game_over
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
    unless game_over
      round_success_message
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def require_sequence
    puts "Enter the first letter of the color of the sequence"
    @seq.each do |color|
      pick = gets.chomp
      if color[0] != pick
        @game_over = true
        break
      end
    end
    sleep(0.5)
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Awesome job, you're a superstar"
  end

  def game_over_message
    puts "Game over, let's play again!"
  end

  def reset_game
    @sequence_length = 1
    @seq = []
    @game_over = false
  end
end

# Simon.new.play
