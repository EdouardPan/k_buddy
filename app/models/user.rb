class User < ApplicationRecord
  has_many :medical_records, dependent: :destroy
  has_many :symptoms, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :appointments, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
