class CollaboratorsController < ApplicationController
	def new
		@collaborator = Collaborator.new
		@wiki = Wiki.find(params[:wiki_id])
	end

	def create
		@wiki = Wiki.find(params[:wiki_id])
		user = User.where(email: params[:collaborator][:email]).first
		email = user.email
		
		# check if user is already a collaborator
		if @wiki.users.include?(user)
			flash[:alert] = "User is already a collaborator."
		# check if user exists
		elsif user.nil?
			flash[:alert] = "User not found."
		# check if user is the wiki owner
		elsif user == current_user
			flash[:alert] = "Wiki owner cannot be a collaborator."
		# Build collaborator object
		elsif Collaborator.create(user: user, wiki: @wiki, email: email)
        	flash[:notice] = "Collaborator added."
    	else
			flash[:alert] = "There was a problem adding this user as a collaborator. Please try again."

		end

        redirect_to new_wiki_collaborator_path(@wiki)
	end

	# def edit
 #      @collaborator = Collaborator.find(params[:id])
	# end

	# def update
	#   @collaborator = Collaborator.find(params[:id])

	#   if @collaborator.update_attributes(collaborator_params)
	#       flash[:notice] = "Collaborator was saved."
	#       redirect_to [@wiki]
	#   else
	#       render :edit
	#   end
	# end

	def destroy
		@collaborator = Collaborator.find(params[:id])
		if @collaborator.destroy
          flash[:notice] = "\"#{@collaborator.email}\" was removed as a collaborator."
          # redirect_to edit_wiki_path
		else
		  render :edit
		end
		redirect_to edit_wiki_path(@collaborator.wiki)
	end

	private

	def collaborator_params
      params.require(:collaborator).permit(:email)
  	end
end