class Appointment < ApplicationRecord
  belongs_to :medical_professional
  belongs_to :user
  has_many :photos, dependent: :destroy

  APPCATEGORIES = ["Consultation Médicale", "Imagerie", "Prise de Sang", "Chimiothérapie", "Radiothérapie", "Opération", "Kinésithérapie", "Autre"]
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true, inclusion: { in: APPCATEGORIES }

  def sorting_date
    start_date
  end

end
