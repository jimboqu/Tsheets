class JobPolicy
  attr :user, :job, :jobs
		def initialize user, job 
	  	@user = user
	  	@job = job
	  end

	  def show?
	  	job.user == user
	  end

	  def edit?
	  	job.user == user
	  end
end

