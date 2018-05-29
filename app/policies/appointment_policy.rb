class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    record.user == user  # Only appointment creator can view it
  end

  def create?
    true  # Anyone can create a appointment
  end

  def update?
    record.user == user  # Only appointment creator can update it
  end

  def destroy?
    record.user == user  # Only appointment creator can update it
  end
end
