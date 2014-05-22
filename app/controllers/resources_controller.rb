class ResourcesController < ApplicationController
   skip_before_action :authorize, only: [:index, :show]

  def index
    if params[:tag]
      @resources = Resources.tagged_with(params[:tag]).order("name")
    else
      @resources = Resources.all.order("name")
    end
  end

  def edit
    @resources = Resources.all.order("name")
  end

  def show
    @resource = Resources.find(params[:id])
  end

  def update
    @resource = Resources.find(params[:id])
    @resource.update(resource_params)
    redirect_to edit_resources_path
  end

  private

  def resource_params
    params.require(:resources)
          .permit(:name, :link, :format_list, :proglang_list)
  end

end