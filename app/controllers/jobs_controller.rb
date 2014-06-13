class JobsController < ApplicationController
  def index
    @jobs = Job.all.order(updated_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job =  Job.new(job_params)

    if @job.save
     redirect_to job_path(@job)
    else
      render :new
    end
  end

  def new
    @job = Job.new()
  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:company_id)
  end

end
