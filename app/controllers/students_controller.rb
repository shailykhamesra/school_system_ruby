require_relative 'application_controller'
class StudentsController < ApplicationController

  def create
    @student = Student.new(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], classroom_id: params['classroom_id'])
    @student.save
    response(status=nil, headers=nil) do
      erb 'students/show'
    end
  end

  def show
    fetch_student
    response(status=nil, headers=nil) do
      erb 'students/edit'
    end
  end

  def update
    fetch_student
    @student.update(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], classroom_id: params['classroom_id'])
    response(status=nil, headers=nil) do
      erb 'students/show'
    end
  end

  def destroy
    fetch_student
    @student.destroy
    response(status=nil, headers=nil) do
      erb 'students/display'
    end
  end

  def index
    @students = Student.where(classroom_id: params['id'])
    response(status=nil, headers=nil) do
      erb 'students/index'
    end
  end

  private

  def fetch_student
    @student = Student.find(params['id'])
  end
 
end
