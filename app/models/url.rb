class Url < ApplicationRecord
  validates :isin, presence: true, uniqueness: true
  validates :url1, presence: true
  validates :url2, :url3, :url4, :url5, :url6, :url7, :url8, :url9, :url10, uniqueness: true, allow_blank: true
end