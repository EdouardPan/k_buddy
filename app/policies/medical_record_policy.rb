class MedicalRecordPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    record.user == user  # Only medical_record creator can view it
  end

  def create?
    true  # Anyone can create a medical_record
  end

  def update?
    record.user == user  # Only medical_record creator can update it
  end

  def destroy?
    record.user == user  # Only medical_record creator can update it
  end
end
