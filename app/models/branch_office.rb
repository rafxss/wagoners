class BranchOffice < ApplicationRecord
  belongs_to :partner
  has_many :offers
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }



  def to_s
    "#{self.partner.name} - #{self.address}"
  end

end
