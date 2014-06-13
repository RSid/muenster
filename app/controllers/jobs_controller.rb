class JobsController < ApplicationController
  def index

    if params[:search]
      @jobs = Job.search(params[:search])
    else
      @jobs = Job.all.order(updated_at: :desc)
    end

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

  def edit
    @job = Job.find(params[:id])

  end

  def update

    @job =  Job.find(params[:id])

    if @job.update(job_params)
     redirect_to job_path(@job)
    else
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])

    if @job.destroy
      redirect_to jobs_path
    else
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,:description,:company_id)
  end

end
