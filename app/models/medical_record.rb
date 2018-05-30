class MedicalRecord < ApplicationRecord
  belongs_to :user

  validates :record_date, presence: true
  validates :category, inclusion: { in: ["Consultation Médicale", "Opération", "Vaccin", "Maladie Infantile", "Antécédent Familial", "Prise de Sang", "Autre"] }

  mount_uploaders :photos, PhotoUploader
end
