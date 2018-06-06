class PrescriptionPolicy < DefaultPolicy

  def show?
    record.treatments.first.user == user
  end

  def add_dose?
    true
  end
end
