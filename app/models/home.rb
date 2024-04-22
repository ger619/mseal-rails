class Home < ApplicationRecord
  def score
    # Display last match where it has scores
    Opponent.where('match_date <= ?', Date.today).where.not(score_one: nil).where.not(score_two: nil).first
  end

  def daily
    Opponent.where('match_date >= ?', Date.today).order('match_date ASC')
  end
end
