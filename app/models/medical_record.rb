class MedicalRecord < ApplicationRecord
  belongs_to :user

  validates :record_date, presence: true
  validates :category, presence: true

  mount_uploaders :photos, PhotoUploader
end
