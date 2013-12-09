class ProjectsController < ApplicationController
  load_and_authorize_resource
  respond_to :json

  # GET /devices
  # GET /devices.json
  def index
    @projects = Project.all
  end

end
