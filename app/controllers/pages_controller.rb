class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @user_address = [ lat: @product.latitude, lng: @product.longitude ]

    @user_address = [ lat: current_user.latitude, lng: current_user.longitude  ] # TODO: Retrieve current_user.lat and current_user.lng

    @offices = BranchOffice.all.geocoded.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude
      }
    end

  end
end
