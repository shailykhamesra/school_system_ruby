require_relative 'school_system'
require_relative '../app/controllers/schools_controller'
require_relative '../app/controllers/classrooms_controller.rb'
require_relative '../app/controllers/teachers_controller.rb'
require_relative '../app/controllers/students_controller.rb'

class Routes < SchoolSystem
  def call(env)
    status = headers = nil
    case env["REQUEST_PATH"]
    when '/'
      response(status, headers) do
        erb 'schools/index'
      end
    when '/new'
      response(status, headers) do
        erb 'schools/new'
      end
    when '/edit'
      response(status, headers) do
        erb 'schools/edit'
      end
    when '/edit_classroom'
      response(status, headers) do
        erb 'classrooms/edit'
      end
    when '/new_classroom'
      response(status, headers) do
        erb 'classrooms/new'
      end
    when '/new_teacher'
      response(status, headers) do
        erb 'teachers/new'
      end
    when '/new_student'
      response(status, headers) do
        erb 'students/new'
      end
    when '/submit'
      SchoolsController.new(env).create
    when '/view'
      SchoolsController.new(env).index
    when '/show'
      SchoolsController.new(env).show
    when '/update'
      SchoolsController.new(env).update
    when '/delete'
      SchoolsController.new(env).destroy
    when '/submit_classroom'
      ClassroomsController.new(env).create
    when '/index'
      ClassroomsController.new(env).index
    when '/update_classroom'
      ClassroomsController.new(env).update
    when '/delete_classroom'
      ClassroomsController.new(env).destroy
    when '/show_classroom'
      ClassroomsController.new(env).show
    when '/submit_teacher'
      TeachersController.new(env).create
    when '/show_teacher'
      TeachersController.new(env).show
    when '/index_teachers'
      TeachersController.new(env).index
    when '/delete_teacher'
      TeachersController.new(env).destroy
    when '/update_teacher'
      TeachersController.new(env).update
    when '/submit_student'
      StudentsController.new(env).create
    when '/index_students'
      StudentsController.new(env).index
    when '/show_student'
      StudentsController.new(env).show
    when '/delete_student'
      StudentsController.new(env).destroy
    when '/update_student'
      StudentsController.new(env).update
    # else
    #   status = '404'
    #   headers = {"Content-Type" => 'text/html', "Content-Length" => '60'}
    #   response(status, headers) do
    #     erb :not_found
    #   end
    end
  end
end