class ResourcesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]

  def index
    if params[:tag]
      @resources = Resource.tagged_with(params[:tag]).order("name")
    else
      @resources = Resource.all.order("name")
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
    params.require(:resources)
          .permit(:name, :link, :format_list, :proglang_list)
  end

end