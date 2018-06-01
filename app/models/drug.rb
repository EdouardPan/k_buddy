class Drug < ApplicationRecord
  has_many :treatments

  DRUGS = ["Capecitabine", "Loperamide", "Smecta", "Vogalene", "Bicarbonate de Na", "Kytril", "Prednisone", "Emend", "Zarzio", "Decapeptyl", "Lidocaine", "Levocetirizine"]
  validates :name, presence: true, uniqueness: true # inclusion: { in: API medoc}
  validates :name, inclusion: { in: DRUGS }

end
