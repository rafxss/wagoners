class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @user_address = [ lat: @product.latitude, lng: @product.longitude ]

    # @user_address = [ lat: current_user.latitude, lng: current_user.longitude  ]

    # @offices = BranchOffice.all.geocoded.map do |office|
    #   {
    #     lat: office.latitude,
    #     lng: office.longitude
    #   }
  end

  def profile
    @user = User.find(params[:id])
  end
end
