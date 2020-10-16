class BranchOffice < ApplicationRecord
  geocoded_by :address
  belongs_to :partner

  after_validation :geocode, if: :will_save_change_to_address?
end
