class PrescriptionPolicy < DefaultPolicy

  def show?
    record.treatments.first.user == user
  end
end
