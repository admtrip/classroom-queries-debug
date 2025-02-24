class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
    render({ template: "department_templates/index" })
  end

  def show
    @department = Department.find(params[:id])
    @courses = @department.courses
    render({ template: "department_templates/show" })
  end
end
