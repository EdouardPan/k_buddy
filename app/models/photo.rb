class Photo < ApplicationRecord
  belongs_to :appointment, optional: true
  belongs_to :medical_record, optional: true
  belongs_to :prescription, optional: true

  validates :url, presence: true

  mount_uploader :url, PhotoUploader
end
