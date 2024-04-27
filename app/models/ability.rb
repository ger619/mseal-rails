class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, Motor::Admin, :all
    elsif user.moderator?
      can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic, Season], :all
    else
      can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team, Statistic], :all
    end
  end
end
