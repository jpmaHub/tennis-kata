require 'tennis'
# frozen_string_literal: true

describe Tennis do
  let(:new_game) { Tennis.new }
  context 'given no player has scored' do
    it 'returns love-love' do
      expect(new_game.score).to eq('love-love')
    end
  end

  context 'given player 1 has scored' do
    it 'returns fifeen-love' do
      new_game.player_score(1)
      expect(new_game.score).to eq('fifteen-love')
    end
  end

  context 'given player 2 has scored' do
    it 'returns love-fifeen' do
      new_game.player_score(2)
      expect(new_game.score).to eq('love-fifteen')
    end
  end

  context 'given both players has scored twice' do
    it 'returns thirty-thirty' do
      2.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      expect(new_game.score).to eq('thirty-thirty')
    end
  end

  context 'given player1 has scored three times and player2 has scored twice' do
    it 'returns forty-thirty' do
      2.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      new_game.player_score(1)
      expect(new_game.score).to eq('forty-thirty')
    end
  end

  context 'given both players has scored three times' do
    it 'returns deuce' do
      3.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      expect(new_game.score).to eq('deuce')
    end
  end

  context 'given player 1 has advantage' do
    it 'returns advantage player1' do
      3.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      new_game.player_score(1)
      expect(new_game.score).to eq('advantage player1')
    end
  end

  context 'given player 1 has advantage again' do
    it 'returns advantage player1' do
      4.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      new_game.player_score(1)
      expect(new_game.score).to eq('advantage player1')
    end
  end

  context 'given player 2 has advantage' do
    it 'returns advantage player2' do
      3.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      new_game.player_score(2)
      expect(new_game.score).to eq('advantage player2')
    end
  end

  context 'given player1 has won' do
    it 'returns player1 won' do
      4.times {
        new_game.player_score(1)
      }
      expect(new_game.score).to eq('player1 has won')
    end
  end
  
  context 'given player 1 has won after advantage' do
    it 'returns player1 has won' do
      3.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      2.times { new_game.player_score(1) }
      expect(new_game.score).to eq('player1 has won')
    end
  end

  context 'given player2 has won' do
    it 'returns player2 won' do
      4.times {
        new_game.player_score(2)
      }
      expect(new_game.score).to eq('player2 has won')
    end
  end

  context 'given player 2 has won after advantage' do
    it 'returns player2 has won' do
      3.times {
        new_game.player_score(1)
        new_game.player_score(2)
      }
      2.times { new_game.player_score(2) }
      expect(new_game.score).to eq('player2 has won')
    end
  end
end
