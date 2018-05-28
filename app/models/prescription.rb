class Prescription < ApplicationRecord
  belongs_to :medical_professional
  has_many :treatments
end
