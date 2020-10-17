class Partner < ApplicationRecord
  has_many :branch_offices
  has_many :offers
  validates :name, presence: true
end
