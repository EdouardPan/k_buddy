class UserPolicy < ApplicationPolicy


  def show?
    true
  end

  def update?
    show?  # Only appointment creator can update it
  end

end
