class Treatment < ApplicationRecord
  belongs_to :prescription
  belongs_to :drug
  belongs_to :user

  validates :take_time, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :taken, :inclusion => { :in => [true, false] }
end
