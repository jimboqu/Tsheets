class ClientsController < ApplicationController
	before_action :correct_user

  def index
  	@clients = Client.where(user_id: current_user.id)
  end

  def edit
    @client = Client.find(params[:id])
    authorize @client
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render 'new'
    end
  end

  def new
  	@client = current_user.clients.build
  end

  def create
  	@client = current_user.clients.build(client_params)
	if @client.save
		redirect_to @client
	else
		render 'new'
	end
  end

  def show
  	@client = Client.find(params[:id])
    authorize @client
    
  end

  def destroy
    authorize @client
    @client.destroy
    redirect_to root_path
  end

  private

  	def client_params
  		params.require(:client).permit(:name, :about, :rate, jobs_attributes: [:name, :info, :id])
  	end

  	def client_set
  		@client = Client.find(params[:id])
  	end

    def correct_user
      @client = current_user.clients.find_by(id: params[:id])
    end
end
