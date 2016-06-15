class BlockPolicy 
  attr :user, :block
	  def initialize user, block 
	  	@user = user
	  	@block = block
	  end

	  def show?
	  	block.user == user
	  end

	  def edit?
	    block.user == user 
	  end

	  


end