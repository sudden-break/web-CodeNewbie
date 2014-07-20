class ResourcesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    if params[:tag]
      @resources = Resource.tagged_with(params[:tag]).order("name")
    else
      @resources = Resource.all.order("name")
    end
  end

  # def new
  #   @resource = Resource.new
  #   respond_to { |format| format.html }
  # end

  def create
    @resource = Resource.new(resource_params)
    respond_to do |format|
      if @resource.save
        format.html { redirect_to resources_path, notice: 'Resource was successfully created.' }
      else
        format.html { render action: 'new', notice: 'Error creating Resource!' }
      end
    end
  end

  def edit
    @resources = Resource.all.order("name")
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])

    if params[:update_button]
      @resource.update(resource_params)
      @update = true
    else
      @resource.destroy
      @delete = true
    end

    respond_to { |format| format.js }
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :link, :description, :format_list, :proglang_list)
  end

end