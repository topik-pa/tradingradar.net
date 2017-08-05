class Stock < ApplicationRecord
  has_many :studies, dependent: :destroy
  has_one :analysis, dependent: :destroy
  validates_associated :studies
  validates :isin, presence: true, uniqueness: true
  validates :name, :cod, uniqueness: true, allow_blank: true
  validates :last_price, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
end