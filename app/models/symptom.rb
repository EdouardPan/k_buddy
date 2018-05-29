class Symptom < ApplicationRecord
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :intensity, inclusion: { in: (0..10).to_a }
end
