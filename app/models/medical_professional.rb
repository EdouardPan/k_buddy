class MedicalProfessional < ApplicationRecord
  has_many :appointments
  has_many :prescriptions

  validates :location_name, presence: true

  def location_with_doctor
    "#{location_name}: #{doctor}"
  end
end
