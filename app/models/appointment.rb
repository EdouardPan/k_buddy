class Appointment < ApplicationRecord
  belongs_to :medical_professional
  belongs_to :user
end
