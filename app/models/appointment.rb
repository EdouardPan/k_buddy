class Appointment < ApplicationRecord
  belongs_to :medical_professional
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :category, presence: true

  mount_uploaders :photos, PhotoUploader
end
