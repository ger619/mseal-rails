class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer]
    cannot :manage, Motor::Admin

    return if user.admin?

    can :manage,
        [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season, Scorer,
         { user_id: user.id }]
  end
end
