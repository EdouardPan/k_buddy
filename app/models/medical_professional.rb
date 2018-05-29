class MedicalProfessional < ApplicationRecord
  has_many :appointments
  has_many :prescriptions

  validates :location_name, presence: true
end
