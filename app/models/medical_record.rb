class MedicalRecord < ApplicationRecord
  belongs_to :user
  CATEGORIES = ["Consultation Médicale", "Opération", "Vaccin", "Maladie Infantile", "Antécédent Familial", "Prise de Sang", "Autre"]
  validates :record_date, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  mount_uploaders :photos, PhotoUploader
end
