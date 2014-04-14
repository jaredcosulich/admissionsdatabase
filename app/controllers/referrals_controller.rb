class ReferralsController < ApplicationController
  before_action :set_family
  before_action :set_referral, only: [:show, :edit, :update, :destroy]

  # GET /referrals
  def index
  end

  # GET /referrals/1
  def show
  end

  # GET /referrals/new
  def new
    @title = 'New Referral'
    @referral = @family.referrals.new
    @referral_options = ReferralOption.all  
  end

  # GET /referrals/1/edit
  def edit
    @referral_options = ReferralOption.all  
  end

  # POST /referrals
  def create
    @referral = @family.referrals.new(referral_params)
    
    if @referral.save
      redirect_to @family
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /referrals/1
  def update
    if @referral.update(referral_params)
      redirect_to @family
    else
      render action: 'edit'
    end
  end

  # DELETE /referrals/1
  def destroy
    @referral.destroy
    redirect_to referrals_url, notice: 'referral was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:family_id])
    end
    
    def set_referral
      @referral = @family.referrals.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def referral_params
      params.require(:referral).permit(:referral_option_id, :comments)
    end
end
