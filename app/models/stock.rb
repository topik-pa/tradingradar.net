class Stock < ApplicationRecord
  has_many :studies, dependent: :destroy
  has_one :analysis
  validates_associated :studies
  validates :isin, presence: true, uniqueness: true
  validates :name, :cod, uniqueness: true, allow_blank: true
  validates :lastPrice, numericality: {greater_than: 0.00}, allow_blank: true
end