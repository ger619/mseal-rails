class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer]
    cannot :manage, Motor::Admin

    return unless user.role == 'moderator'

    can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer]

    return unless user.role == 'admin'

    can :manage,
        Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer, Motor::Admin,
        user.role == 'admin'
  end
end
