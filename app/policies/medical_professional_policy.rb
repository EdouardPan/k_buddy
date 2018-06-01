class MedicalProfessionalPolicy < DefaultPolicy
  class Scope < Scope
    def resolve
      scope.joins(:appointments).where(appointments: { user: user })
    end
  end

  def create?
    true
  end

  def show?
    true
  end
end
