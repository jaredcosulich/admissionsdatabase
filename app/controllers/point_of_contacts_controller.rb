class PointOfContactsController < ApplicationController

  # GET /projects
  def index
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @title = 'New Point Of Contact'
    @point_of_contact = PointOfContact.new
    @point_of_contact_types = PointOfContactType.all
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @point_of_contact = PointOfContact.new(point_of_contact_params)
    
    if @point_of_contact.save
      redirect_to point_of_contact_url(@point_of_contact)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @point_of_contact.update(point_of_contact_params)
      redirect_to @point_of_contact
    else
      render action: 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:title, :url, :description, :photo, :min_time, :max_time, :min_age, :max_age, :min_cost, :max_cost, :estimated_simple, :estimated_age, :estimated_cost, :estimated_time, :tumblr)
    end
end
