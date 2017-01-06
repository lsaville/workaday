class Project < ApplicationRecord
  validates :lat, presence: true
  validates :lng, presence: true
  validates :details, presence: true
  validates :title, presence: true
end
