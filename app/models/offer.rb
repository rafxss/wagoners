class Offer < ApplicationRecord
  belongs_to :branch_office
  has_many :users_to_offers, dependent: :destroy
  has_many :users, through: :users_to_offers

  enum category: OFFER_CATEGORIES

  validates :description, length: { maximum: 200 }
  validates :voucher, presence: true
  validates :category, presence: true

  after_create :create_user_to_offer

  def due_date_changes
    if (Date.today > self.due_date)
      self.destroy
    end
  end

  def create_user_to_offer
    @users = User.all
    @users.each do |user|
      UsersToOffer.create(offer_id: id, user: user)
    end
  end

  include PgSearch::Model
  pg_search_scope :search_by_category, against: :category
  pg_search_scope :search_by_level, against: :level
  # pg_search_scope :filter,
  #   against: [:category, :level]
  # scope :by_category, ->(category) { where(category: category) }
end
