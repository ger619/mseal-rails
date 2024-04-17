class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, Motor::Admin, :all
    elsif user.moderator?
      can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all
    else
      can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all
    end
  end
end
