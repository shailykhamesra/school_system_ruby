require_relative '../../config/school_system.rb'
require 'require_all'
require_all 'app/models/*.rb'

class ApplicationController < SchoolSystem
  attr_accessor :env

  def initialize(env)
    self.env = env
  end

  def params
    @params ||= Rack::Utils.parse_nested_query(env["QUERY_STRING"])
  end
end