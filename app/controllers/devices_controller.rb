class DevicesController < ApplicationController
  load_and_authorize_resource

  respond_to :json
  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    device = Device.find(params[:id])
    device.destroy
    respond_with(device)
  end

  # PUT /devices/1/mark_as_available
  def mark_as_available
    device = Device.find(params[:id])
    device.mark_as_available
    respond_with(device)
  end


  # PUT /devices/1/mark_as_unavailable
  def mark_as_unavailable
    device = Device.find(params[:id])
    device.mark_as_unavailable
    respond_with(device)
  end


  # PUT /devices/1/mark_as_failing
  def mark_as_failing
    device = Device.find(params[:id])
    device.mark_as_failing
    respond_with(device)
  end

=begin
  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end
=end
end
