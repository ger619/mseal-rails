class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
      can :manage, Motor::Admin, all
    elsif user.role == 'moderator'
      can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all

    else
      user.role
      can :read, :all
    end
  end
end
