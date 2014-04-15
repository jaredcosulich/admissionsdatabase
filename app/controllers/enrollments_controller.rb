class EnrollmentsController < ApplicationController
  before_action :set_student
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]

  # GET /point_of_contacts
  def index
  end

  # GET /point_of_contacts/1
  def show
  end

  # GET /point_of_contacts/new
  def new
    @title = 'New Enrollment'
    @enrollment = @student.enrollments.new
  end

  # GET /enrollments/1/edit
  def edit
  end

  # POST /enrollments
  def create
    @enrollment = @student.enrollments.new(enrollment_params)
    
    if @enrollment.save
      redirect_to family_student_path(@student.family, @student)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /enrollments/1
  def update
    if @enrollment.update(enrollment_params)
      redirect_to family_student_path(@student.family, @student)
    else
      render action: 'edit'
    end
  end

  # DELETE /enrollments/1
  def destroy
    @enrollment.destroy
    redirect_to enrollments_url, notice: 'enrollment was successfully destroyed.'
  end

  private
    def set_student
      @student = Student.find(params[:student_id] || params[:enrollment][:student_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_enrollment
      @enrollment = @student.enrollments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enrollment_params
      params.require(:enrollment).permit(:start, :end, :comments)
    end
end
