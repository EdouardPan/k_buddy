class Appointment < ApplicationRecord
  belongs_to :medical_professional
  belongs_to :user
  has_many :photos

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true

  def sorting_date
    start_date
  end

end
