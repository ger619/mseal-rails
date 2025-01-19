class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
    end
    can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer]

    return unless user.role == 'moderator'

    can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer]
  end
end
