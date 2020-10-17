class Offer < ApplicationRecord
  belongs_to :partner
  has_many :users_to_offers, dependent: :destroy
  has_many :users, through: :users_to_offer

  enum category: OFFER_CATEGORIES

  validates :description, length: { maximum: 200 }
  validates :voucher, presence: true
  validates :category, presence: true

  def due_date_changes
    if (Date.today > self.due_date)
      self.destroy
    end
  end
end
