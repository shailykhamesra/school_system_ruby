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
    @school = School.find(params['id'])
    response(status=nil, headers=nil) do
      erb 'schools/edit'
    end
  end

  def update
    @school = School.find(params['id'])
    @school.update(name: params['name'], address: params['address'], phone_no: params['phone_number'], code: params['code'])
    response(status=nil, headers=nil) do
      erb 'schools/show'
    end
  end

  def destroy
    @school = School.find(params['id'])
    @school.destroy
    response(status=nil, headers=nil) do
      erb 'schools/display'
    end
  end

  # private 

  #  # def school_params
  #  # 	params.permit(:name, :address, :phone_no, :code)
  #  # end

end