require_relative 'application_controller'
class StudentsController < ApplicationController
  
  def index
    @students = Classroom.find(params['id']).students.all
    response(status=nil, headers=nil) do
      erb 'students/index'
    end
  end

  def create
    @student = Student.new(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], classroom_id: params['classroom_id'])
    @student.save
    response(status=nil, headers=nil) do
      erb 'students/show'
    end
  end

  def show
    @student = Student.find(params['id'])
    response(status=nil, headers=nil) do
      erb 'students/edit'
    end
  end

  def update
    @student = Student.find(params['id'])
    @student.update(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], classroom_id: params['classroom_id'])
    response(status=nil, headers=nil) do
      erb 'students/show'
    end
  end

  def destroy
    @student = Student.find(params['id'])
    @student.destroy
    response(status=nil, headers=nil) do
      erb 'students/display'
    end
  end

  private

  # def student_params
  #   params.require(:student).permit(:name, :address, :phone_no, :gender, :school_id, :classroom_id)
  # end
end
