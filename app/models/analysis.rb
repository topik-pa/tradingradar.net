class Analysis < ApplicationRecord
  has_one :stock
  validates :isin, presence: true, uniqueness: true
  validates :borsa_italiana_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :borsa_italiana_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :xxivore_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :xxivore_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :repubblica_support, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
  validates :repubblica_resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_nil: true
end