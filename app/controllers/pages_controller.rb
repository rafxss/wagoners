class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @user_address = [ lat: @product.latitude, lng: @product.longitude ]
    @user_address = [ lat: -77.0291, lng: -12.1185 ] # TODO: Retrieve current_user.lat and current_user.lng
  end
end
