class MedicalRecord < ApplicationRecord
  belongs_to :user

  validates :record_date, presence: true
  validates :type, presence: true
end
