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
    can :approve_teammates, Team do |team|
      user.team == team
    end

    can :edit, Buspreneur, id: user.id

    cannot :request, Buspreneur
    cannot :invest, Team
    can :edit_team, Team do |team|
      user.team == team
    end
    can :request_milestone, Team do |team|
      user.team == team
    end
    can :submit_update, Team do |team|
      user.team == team
    end
    can :edit_profile, Buspreneur
  end

  def investor_abilities(user)
    can :request, Buspreneur
    can :show, Buspreneur
    can :invest, Team
  end

  def visitor_abilities(user)
  end

end
