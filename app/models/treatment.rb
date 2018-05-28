class Treatment < ApplicationRecord
  belongs_to :prescription
  belongs_to :drug
  belongs_to :user
end
