class Analysis < ApplicationRecord
  validates :isin, presence: true, uniqueness: true
  validates :borsaItalianaSupport, numericality: {greater_than: 0.00}, allow_nil: true
  validates :borsaItalianaResistance, numericality: {greater_than: 0.00}, allow_nil: true
  validates :xxivOreSupport, numericality: {greater_than: 0.00}, allow_nil: true
  validates :xxivOreResistance, numericality: {greater_than: 0.00}, allow_nil: true
  validates :repubblicaSupport, numericality: {greater_than: 0.00}, allow_nil: true
  validates :repubblicaResistance, numericality: {greater_than: 0.00}, allow_nil: true
end