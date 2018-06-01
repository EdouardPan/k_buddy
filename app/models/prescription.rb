class Prescription < ApplicationRecord
  belongs_to :medical_professional
  has_many :treatments
  has_many :photos, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true


end
