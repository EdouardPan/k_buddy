class Symptom < ApplicationRecord
  belongs_to :user

  include PgSearch

  pg_search_scope :search_symptom,
    against: [ :name, :start_date, :end_date, :intensity, :description ],
    using: {
      tsearch: { prefix: true }
    }

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :intensity, inclusion: { in: (0..10).to_a }
end
