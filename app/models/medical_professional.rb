class MedicalProfessional < ApplicationRecord
  has_many :appointments
  has_many :prescriptions

  validates :location_name, presence: true
  validates :doctor, uniqueness: { scope: :location_name}

  def location_with_doctor
   doctor == "" ? "#{location_name}" : "#{location_name}: #{doctor}"
  end
end
