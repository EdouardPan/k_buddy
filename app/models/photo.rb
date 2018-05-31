class Photo < ApplicationRecord
  belongs_to :appointment
  belongs_to :medical_record
  belongs_to :prescription
end
