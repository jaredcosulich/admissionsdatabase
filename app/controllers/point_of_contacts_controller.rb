class PointOfContactsController < ApplicationController
  before_action :set_family
  before_action :set_point_of_contact, only: [:show, :edit, :update, :destroy]

  # GET /point_of_contacts
  def index
  end

  # GET /point_of_contacts/1
  def show
  end

  # GET /point_of_contacts/new
  def new
    @title = 'New Point Of Contact'
    @point_of_contact = PointOfContact.new
    @point_of_contact_types = PointOfContactType.all
    @families = Family.all
  end

  # GET /point_of_contacts/1/edit
  def edit
  end

  # POST /point_of_contacts
  def create
    @point_of_contact = PointOfContact.new(point_of_contact_params)
    
    if @point_of_contact.save
      redirect_to @family
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /point_of_contacts/1
  def update
    if @point_of_contact.update(point_of_contact_params)
      redirect_to @point_of_contact
    else
      render action: 'edit'
    end
  end

  # DELETE /point_of_contacts/1
  def destroy
    @point_of_contact.destroy
    redirect_to point_of_contacts_url, notice: 'point_of_contact was successfully destroyed.'
  end

  private
    def set_family
      @family = Family.find(params[:family_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_contact
      @point_of_contact = @family.point_of_contacts.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def point_of_contact_params
      params.require(:point_of_contact).permit(:point_of_contact_type_id, :date, :comments)
    end
end
