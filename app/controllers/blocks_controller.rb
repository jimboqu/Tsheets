class BlocksController < ApplicationController
  def index
  	@blocks = Block.where(user_id: current_user.id)
  end

  def new
  	
  	#@block = Block.new
  	@block = current_user.blocks.build
  	@client = Client.find(params[:client])
  	@job = Job.where(client_id: @client.id, user_id: current_user.id)
  	
  end

  def create
  	@block = current_user.blocks.build(block_params)
  	if @block.save
  		redirect_to @block
  	else
  		render 'new'
  	end
  end

  def show
  	@block = Block.find_by(id: params[:id])
    authorize @block
  end

  def edit
    @block = current_user.blocks.build
    authorize @block
  end

  private 

  	def block_params
  		params.require(:block).permit(:des, :time, :user_id, :job_id )
  	end

  	def correct_user
    	@block = current_user.block.find_by(id: params[:id])
    end
end
