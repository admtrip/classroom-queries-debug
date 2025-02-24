class StudentsController < ApplicationController
  def index
    @students = Student.all
    render({ template: "student_templates/index" })
  end

  def show
    @student = Student.includes(:courses).find(params[:id])
    @enrolled_courses = @student.courses
    render({ template: "student_templates/show" })
  end
end
