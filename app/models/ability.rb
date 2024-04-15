class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all
      can :access, :motor_admin

    else
      can :read, :all
    end
  end
end
