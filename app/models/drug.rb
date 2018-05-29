class Drug < ApplicationRecord
  has_many :treatments

  validates :name, presence: true, uniqueness: true, # inclusion: { in: API medoc}
end
