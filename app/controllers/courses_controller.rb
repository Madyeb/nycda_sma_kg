class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find_by_id(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      flash[:notice] = "Course was successfully saved!"
      redirect_to courses_path
    else
      render :new
    end
  end

  def update
    @course = Course.find_by_id(params[:id])

    if @course.update_attributes(course_params)
      flash[:notice] = "Course was successfully updated!"
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find_by_id(params[:id])
    redirect_to courses_path, notice: "Course was deleted"
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end

end