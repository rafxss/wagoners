class UsersToOffersController < ApplicationController
  before_action :set_users_to_offer, only: [:show, :edit, :update, :destroy]

  # GET /users_to_offers
  # GET /users_to_offers.json
  def index
    @users_to_offers = UsersToOffer.all
  end

  # GET /users_to_offers/1
  # GET /users_to_offers/1.json
  def show
  end

  # GET /users_to_offers/new
  def new
    @users_to_offer = UsersToOffer.new
  end

  # GET /users_to_offers/1/edit
  def edit
  end

  # POST /users_to_offers
  # POST /users_to_offers.json
  def create
    @users_to_offer = UsersToOffer.new(users_to_offer_params)

    respond_to do |format|
      if @users_to_offer.save
        format.html { redirect_to @users_to_offer, notice: 'Users to offer was successfully created.' }
        format.json { render :show, status: :created, location: @users_to_offer }
      else
        format.html { render :new }
        format.json { render json: @users_to_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_to_offers/1
  # PATCH/PUT /users_to_offers/1.json
  def update
    respond_to do |format|
      if @users_to_offer.update(users_to_offer_params)
        format.html { redirect_to @users_to_offer, notice: 'Users to offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_to_offer }
        # @users_to_offer.user.update(point: 100)

      else
        format.html { render :edit }
        format.json { render json: @users_to_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_to_offers/1
  # DELETE /users_to_offers/1.json
  def destroy
    @users_to_offer.destroy
    respond_to do |format|
      format.html { redirect_to users_to_offers_url, notice: 'Users to offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_to_offer
      @users_to_offer = UsersToOffer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_to_offer_params
      params.require(:users_to_offer).permit(:user_id, :offer_id, :used, :code_used)
    end
end
