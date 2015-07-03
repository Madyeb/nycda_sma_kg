class StudentsController < ApplicationController
  before_action :authenticate
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:notice] = "Student was successfully created!"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def edit
   @student = Student.find_by_id(params[:id]) 
  end

  def update
    @student = Student.find_by_id(params[:id])

    if @student.update_attributes(student_params)
      flash[:notice] = "Student was successfully updated"
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find_by_id(params[:id])
    @student.destroy
    flash[:notice] = "Student was successfully removed"

    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone, :status, :photo, :course_ids=>[])
  end
end