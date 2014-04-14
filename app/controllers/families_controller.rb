class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  # GET /families
  def index
  end

  # GET /families/1
  def show
  end

  # GET /families/new
  def new
    @title = 'New Family'
    @family = Family.new
    @newsletter_options = NewsletterOption.all  
  end

  # GET /families/1/edit
  def edit
    @newsletter_options = NewsletterOption.all
  end

  # POST /families
  def create
    @family = Family.new(family_params)
    
    if @family.save
      redirect_to family_url(@family)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /families/1
  def update
    if @family.update(family_params)
      redirect_to @family
    else
      render action: 'edit'
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy
    redirect_to families_url, notice: 'Family was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_params
      params.require(:family).permit(:parent_1_name, :parent_2_name, :phone_number, :newsletter_option_id)
    end
end
