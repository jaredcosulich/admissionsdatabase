class StudentsController < ApplicationController
  before_action :set_family
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    @title = 'New Student'
    @student = Student.new
    @newsletter_options = NewsletterOption.all  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = @family.students.new(student_params)
    
    if @student.save
      redirect_to family_student_url(@family, @student)
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to family_student_url(@family, @student)
    else
      render action: 'edit'
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:family_id])
    end
    
    def set_student
      @student = @family.students.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :phone_number, :email, :gender, :birthmonth, :graduated, :graduation_date, :comments)
    end
end
