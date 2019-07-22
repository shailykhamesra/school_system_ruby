require_relative 'application_controller'
class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params['id'])
    response(status=nil, headers=nil) do
      erb 'classrooms/edit'
    end
  end

  def index
    @classrooms = School.find(params['id']).classrooms.all
    response(status=nil, headers=nil) do
      erb 'classrooms/index'
    end
  end

  def create
    @classroom = Classroom.new(room_no: params['room_no'], class_no: params['class_no'], school_id: params['school_id'])
    @classroom.save
    response(status=nil, headers=nil) do
      erb 'classrooms/show'
    end
  end

  def update
    @classroom = Classroom.find(params['id'])
    @classroom.update(room_no: params['room_no'], class_no: params['class_no'], school_id: params['school_id'])
    response(status=nil, headers=nil) do
      erb 'classrooms/show'
    end
  end

  def destroy
    @classroom = Classroom.find(params['id'])
    @classroom.destroy
    response(status=nil, headers=nil) do
      erb 'classrooms/display'
    end
  end
end
