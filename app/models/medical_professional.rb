class MedicalProfessional < ApplicationRecord
  has_many :appointments
  has_many :prescriptions
end
