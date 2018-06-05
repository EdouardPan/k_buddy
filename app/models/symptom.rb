class Symptom < ApplicationRecord
  belongs_to :user

  include PgSearch

  pg_search_scope :search_symptom,
    against: [ :name, :start_date, :end_date, :intensity, :description ],
    using: {
      tsearch: { prefix: true }
    }

  SYMPTOMS = [ "Altérations du goût", "Anémie", "Ascite", "Bouche sèche ou douleureuse", "Chute des cheveux", "Chute des cils et sourcils", "Constipation", "Cystite", "Défaillance cardiaque", "Déglutition douleureuse", "Dents", "Diarrhée", "Divers", "Douleurs", "Estomac", "Fatigue", "Hémorragies (déficit de plaquettes sanguines)", "Stomatite (inflammation de la muqueuse buccale)", "Intolérance au lactose", "Leucopénie", "Lymphoedème", "Manque d'appétit", "Migraine", "Mucosités", "Nausées", "Nerfs", "Ongles", "Perte de poids non souhaitées", "Prise de poids non souhaitée", "Sexualité", "Stomies", "Syndrome main-pied", "Thrombose veineuse profonde", "Vessie", "Vomissement" ]
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :intensity, inclusion: { in: (0..10).to_a }
  validates :name, inclusion: { in: SYMPTOMS }
end
