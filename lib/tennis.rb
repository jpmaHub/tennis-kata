# frozen_string_literal: true

class Tennis
  SCORES = { 0 => 'love', 1 => 'fifteen', 2 => 'thirty', 3 => 'forty' }.freeze
  def initialize
    @player1_count = 0
    @player2_count = 0
  end

  def difference
    @player1_count - @player2_count
  end

  def score
    return deuce unless deuce.nil?
    return advantage unless advantage.nil?
    return winner unless winner.nil?
    "#{SCORES[@player1_count]}-#{SCORES[@player2_count]}"
  end

  def player_score(player)
    return @player1_count += 1 if player == 1
    return @player2_count += 1 if player == 2
  end

  def deuce
    return 'deuce' if @player1_count == @player2_count && @player1_count >= 3
  end

  def advantage
    return 'advantage player1' if difference == 1 && @player1_count >= 4
    return 'advantage player2' if difference == -1 && @player2_count >= 4
  end

  def winner
    return 'player1 has won' if difference >= 2 && @player1_count >= 4
    return 'player2 has won' if difference <= -2 && @player2_count >= 4
  end
end
