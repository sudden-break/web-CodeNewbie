class ResourcesController < ApplicationController
   skip_before_action :authorize, only: [:index, :show]

  def index
    @resources = Resources.all
  end

end
