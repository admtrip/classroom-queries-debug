class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:department).all
    @departments = Department.all
    render({ template: "course_templates/index" })
  end

  def show
    @course = Course.find(params[:id])
    @enrolled_students = @course.enrollments.includes(:student)
    render({ template: "course_templates/show" })
  end

  def create
    new_course = Course.new
    new_course.title = params.fetch("query_title")
    new_course.term_offered = params.fetch("query_term_offered")
    new_course.department_id = params.fetch("query_department_id").to_i

    if new_course.save
      redirect_to("/courses")
    else
      render({ template: "course_templates/index" })
    end
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to("/courses")
  end

  def update
    course = Course.find(params[:id])
    course.title = params.fetch("query_title")

    if course.save
      redirect_to("/courses/#{course.id}")
    else
      render({ template: "course_templates/show" })
    end
  end
end
