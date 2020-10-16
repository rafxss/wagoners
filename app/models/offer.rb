class Offer < ApplicationRecord
  belongs_to :partner

  enum category: [:con_credito, :sin_credito,
                  :automoviles, :dirigidas,
                  :no_clientes, :puntos, :comercial]

  validates :description, length: { maximum: 200 }
  validates :voucher, presence: true
  validates :category, presence: true
end
