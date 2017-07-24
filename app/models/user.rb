class User < ApplicationRecord
  has_secure_password
  has_many :studies, dependent: :destroy
  validates_associated :studies
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: "E-mail format not recognized" }
end