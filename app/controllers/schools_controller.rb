require_relative 'application_controller'
class SchoolsController < ApplicationController

  def index
    @schools = School.all
    response(status=nil, headers=nil) do
      erb 'schools/list'
    end
  end

  def create
    @school = School.new(name: params['name'], address: params['address'], phone_no: params['phone_number'], code: params['code'])
    @school.save!
    response(status=nil, headers=nil) do
      erb 'schools/show'
    end
  end

  def show
    fetch_shcool
    response(status=nil, headers=nil) do
      erb 'schools/edit'
    end
  end

  def update
    fetch_shcool
    @school.update(name: params['name'], address: params['address'], phone_no: params['phone_number'], code: params['code'])
    response(status=nil, headers=nil) do
      erb 'schools/show'
    end
  end

  def destroy
    fetch_shcool
    @school.destroy
    response(status=nil, headers=nil) do
      erb 'schools/display'
    end
  end

  private

  def fetch_shcool
    @school = School.find(params['id'])
  end
end