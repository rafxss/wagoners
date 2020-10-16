class Partner < ApplicationRecord
  has_many :branch_offices
  validates :name, presence: true
end
