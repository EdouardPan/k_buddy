class User < ApplicationRecord
  has_many :medical_records, dependent: :destroy
  has_many :symptoms, dependent: :destroy
  has_many :treatments, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :medical_professionals, through: :appointments
  # There is no belongs_to through. Must be a has_many through.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
end
