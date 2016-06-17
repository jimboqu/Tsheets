class JobsController < ApplicationController
  def index
    @jobs = Job.where(user_id: current_user.id)
    
    @tot = 0

    @more = 0
    @jobs.each do |p|
    @total = p.blocks
    @total.each do |b|
      if b.time?
        @more += b.time
      end
    end
  end 
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
    @total = @job.blocks
    @more = 0
    @total.each do |b|
      if b.time?
        @more += b.time 
      end
    end
  end

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job
    else
      render 'edit'
    end
  end

  def new
  	@job = current_user.jobs.build
  end

  def create
  	@job = current_user.jobs.build(job_params)
	if @job.save
		redirect_to @job
	else
		render 'new'
	end
  end

  private 

  	def job_params
  		params.require(:job).permit(:name, :info, :client_id)
  	end

  	def correct_user
    	@job = current_user.job.find_by(id: params[:id])
    end

    def client_set
  		@job = Job.find(params[:id])
  	end
end

