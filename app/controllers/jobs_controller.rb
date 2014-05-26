class JobsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]

  def index
    if params[:tag]
      @jobs = Job.tagged_with(params[:tag]).order("name")
    else
      @jobs = Job.all.order("name")
    end
  end

  def edit
    @jobs = Job.all.order("name")
  end

  def show
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

    if params[:update_button]
      @job.update(job_params)
      @update = true
    else
      @job.destroy
      @delete = true
    end

    respond_to { |format| format.js }
  end

  private

  def job_params
    params.require(:job)
          .permit(:name, :link, :company, :description, :location_list, :position_list, :proglang_list)
  end

end
