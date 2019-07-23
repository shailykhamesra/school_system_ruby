require_relative 'application_controller'
class ClassroomsController < ApplicationController
  def show
    fetch_classroom
    response(status=nil, headers=nil) do
      erb 'classrooms/edit'
    end
  end

  def index
    @classrooms = Classroom.where(school_id: params['id'])
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
    fetch_classroom
    @classroom.update(room_no: params['room_no'], class_no: params['class_no'], school_id: params['school_id'])
    response(status=nil, headers=nil) do
      erb 'classrooms/show'
    end
  end

  def destroy
    fetch_classroom
    @classroom.destroy
    response(status=nil, headers=nil) do
      erb 'classrooms/display'
    end
  end

  private

  def fetch_classroom
    @classroom = Classroom.find(params['id'])
  end
end
