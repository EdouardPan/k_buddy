class MedicalRecord < ApplicationRecord
  belongs_to :user
  has_many :photos
  include PgSearch

  pg_search_scope :search,
    against: [ :title, :category, :description ],
    using: {
      tsearch: { prefix: true }
    }

  CATEGORIES = ["Consultation Médicale", "Opération", "Vaccin", "Maladie Infantile", "Antécédent Familial", "Prise de Sang", "Autre"]
  # validates :record_date, presence: true
  # validates :category, inclusion: { in: CATEGORIES }



end


