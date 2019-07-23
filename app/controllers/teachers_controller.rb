require_relative 'application_controller'
class TeachersController < ApplicationController

  def create
    @teacher = Teacher.new(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], school_id: params['school_id'])
    @teacher.save
    response(status=nil, headers=nil) do
      erb 'teachers/show'
    end
  end

  def show
    fetch_teacher
    response(status=nil, headers=nil) do
      erb 'teachers/edit'
    end
  end

  def update
    fetch_teacher
    @teacher.update(name: params['name'], address: params['address'], phone_no: params['phone_no'], gender: params['gender'], school_id: params['school_id'])
    response(status=nil, headers=nil) do
      erb 'teachers/show'
    end
  end

  def destroy
    fetch_teacher
    @teacher.destroy
    response(status=nil, headers=nil) do
      erb 'teachers/display'
    end
  end

  def index
    @teachers = Teacher.where(school_id: params['id'])
    response(status=nil, headers=nil) do
      erb 'teachers/index'
    end
  end

  private
  
  def fetch_teacher
    @teacher = Teacher.find(params['id'])
  end
end
