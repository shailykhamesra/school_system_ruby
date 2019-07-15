require_relative 'application_controller'
class TeachersController < ApplicationController

  def index
    @teachers = School.find(params['id']).teachers.all
    response(status=nil, headers=nil) do
      erb 'teachers/index'
    end
  end

  def create
    @teacher = Teacher.new(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], school_id: params['school_id'])
    @teacher.save
    response(status=nil, headers=nil) do
      erb 'teachers/show'
    end
  end

  def show
    @teacher = Teacher.find(params['id'])
    response(status=nil, headers=nil) do
      erb 'teachers/edit'
    end
  end

  def update
    @teacher = Teacher.find(params['id'])
    @teacher.update(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], school_id: params['school_id'])
    response(status=nil, headers=nil) do
      erb 'teachers/show'
    end
  end

  def destroy
    @teacher = Teacher.find(params['id'])
    @teacher.destroy
    response(status=nil, headers=nil) do
      erb 'teachers/display'
    end
  end

  private

  # def classroom_params
  #   params.require(:classroom).permit(:room_no, :class_no, :school_id, :teacher_id)
  # end
end
