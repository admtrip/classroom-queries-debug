class StudentsController < ApplicationController
  def index
    @students = Student.all
    render({ template: "student_templates/index" })
  end

  def show
    @student = Student.find(params[:id])
    @enrolled_courses = @student.enrollments.includes(:course)
    render({ template: "student_templates/show" })
  end
end
