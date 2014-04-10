class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  def index
  end

  # GET /addresses/1
  def show
  end

  # GET /addresses/new
  def new
    @title = 'New Address'
    @address = Address.new
    @newsletter_options = NewsletterOption.all  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)
    
    if @address.save
      if params[:student_id].present?
        student = Student.find(params[:student_id])
        student.update_attributes(address_id: @address.id)
        redirect_to family_student_path(student.family, student)
      elsif params[:family_id].present?
        family = Family.find(params[:family_id])
        family.update_attributes(address_id: @address.id)
        redirect_to family
      end
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      if params[:student_id].present?
        student = Student.find(params[:student_id])
        student.update_attributes(address_id: @address.id)
        redirect_to family_student_path(student.family, student)
      elsif params[:family_id].present?
        family = Family.find(params[:family_id])
        family.update_attributes(address_id: @address.id)
        redirect_to family
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    redirect_to addresses_url, notice: 'Address was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:street1, :street2, :city, :state, :zipcode, :family_id, :student_id)
    end
end
