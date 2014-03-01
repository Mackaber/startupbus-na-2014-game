class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.admin?
        admin_abilities(user)
      else
        logged_in_abilities(user)
      end
    else
      visitor_abilities(user)
    end
  end

  def admin_abilities(user)
    can :manage, :all
  end

  def logged_in_abilities(user)
    if user.is_a?(Conductor)
      conductor_abilities(user)
    elsif user.is_a?(Buspreneur)
      buspreneur_abilities(user)
    else
      investor_abilities(user)
    end
  end

  def conductor_abilities(user)
    cannot :request, Buspreneur
  end

  def buspreneur_abilities(user)
    can :read, Buspreneur do |buspreneur|
      user == buspreneur && buspreneur.approved?
    end

    can :create_team, :all
    can :approve_teammates, Team

    cannot :request, Buspreneur
  end

  def investor_abilities(user)
    can :request, Buspreneur
    can :show, Buspreneur
  end

  def visitor_abilities(user)
  end

end
