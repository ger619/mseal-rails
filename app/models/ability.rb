class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, Motor, all
    elsif user.moderator?
      can :manage, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all
      cannot %i[read update destroy update], Motor, all
    else
      can :read, [Advert, Club, HallOfFame, News, Opponent, OpponentTeam, Product, Team], :all
      cannot %i[read update destroy update], Motor, all
    end
  end
end
