class CollaboratorsController < ApplicationController
	def new
		@collaborator = Collaborator.new
	end

	def create
		@wiki = Wiki.find(params[:id])
		@collaborator = Collaborator.new(user_id: @wiki.user, wiki_id: @wiki)

        if @collaborator.save
            flash[:notice] = "Collaborator added."
        else
            flash[:alert] = "Collaborator not added."
        end

        redirect_to :back
	end

	def edit
      @collaborator = Collaborate.find(params[:id])
	end

	def update
	  @collaborator = Collaborator.find(params[:id])

	  if @collaborator.update_attributes(collaborator_params)
	      flash[:notice] = "Collaborator was saved."
	      redirect_to [@wiki]
	  else
	      render :edit
	  end
	end

	def destroy
		@collaborator = Collaborator.find(params[:id])
		if @collaborator.destroy
          flash[:notice] = "\"#{@collaborator.email}\" was removed as a collaborator."
          # redirect_to edit_wiki_path
		else
		  render :edit
		end
	end

	private

	def collaborator_params
      params.require(:collaborator).permit(:email)
  	end
end