class ClientPolicy 
	attr :user, :client, :clients
	  def initialize user, client 
	  	@user = user
	  	@client = client
	  	@clients = clients
	  end

	  def edit?
	    client.user == user 
	  end

	  def show?
	  	client.user == user
	  end

	  def destroy?
	  	client.user == user
	  end

end
