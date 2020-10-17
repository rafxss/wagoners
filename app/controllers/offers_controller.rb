class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    # byebug
    # @offers = Offer.all
    if params[:user_id].present?
      @offers = Offer.includes(:users_to_offers).where(users_to_offers: { user_id: current_user.id, code_used: true })
    else
      @offers = Offer.all
    end

    @offers.each do |offer|
      offer.due_date_changes
    end

    @user_address = [ lat: current_user.latitude, lng: current_user.longitude  ]

    @branches_to_show = @offers.map do |offer| 
      {
        lat: offer.branch_office.latitude ,
        lng: offer.branch_office.longitude
      }
    end


    # @offices = BranchOffice.all.geocoded.map do |office|
    #   {
    #     lat: office.latitude,
    #     lng: office.longitude
    #   }
    # end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    offer_lat = @offer.branch_office.latitude
    offer_lon = @offer.branch_office.longitude

    user_lat = current_user.latitude
    user_lon = current_user.longitude

    @distance = Geocoder::Calculations.distance_between([offer_lat, offer_lon], [user_lat, user_lon], units: :km).round(1)
    @office = [ lat: offer_lat, lng: offer_lon, address: @offer.branch_office.address  ]
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params



      params.require(:offer).permit(:branch_office_id, :description, :voucher, :category, :level, :url, :due_date )


    end
end
