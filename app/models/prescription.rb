class Prescription < ApplicationRecord
  belongs_to :medical_professional
  has_many :treatments, dependent: :destroy
  # The treatments that depend on the prescription will be deleted.
  # No need to change the treatment policy.
  has_many :photos, dependent: :destroy


  validates :start_date, presence: true
  validates :end_date, presence: true

  accepts_nested_attributes_for :treatments
  accepts_nested_attributes_for :photos

end
