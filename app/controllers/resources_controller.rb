class ResourcesController < ApplicationController
   skip_before_action :authorize, only: [:index, :show]

  def index
    @resources = Resources.all
  end

  def edit
    @resources = Resources.all
  end

  def update
    @resource.update(resource_params)
    @resource.
    redirect_to edit_path
  end

  private

  def resource_params
    params.require(resource).permit(:name, :link)
  end

end
