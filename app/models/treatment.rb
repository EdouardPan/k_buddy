class Treatment < ApplicationRecord
  belongs_to :prescription
  belongs_to :drug
  belongs_to :user

  validates :take_time, presence: true
  validates :quantity, presence: true

  def sorting_date
    take_time
  end
end
