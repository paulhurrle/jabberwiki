class WikisController < ApplicationController
  def index
      # @wikis = Wiki.visible(current_user)
      @wikis = policy_scope(Wiki)
  end

  def show
      @wiki = Wiki.find(params[:id])
  end

  def new
      @wiki = Wiki.new
  end

  def create
      @wiki = Wiki.new(wiki_params)
      @wiki.user = current_user

      if @wiki.save
          flash[:notice] = "Wiki was saved."
          redirect_to [@wiki]
      else
          flash.now[:alert] = "There was an error saving the wiki. Please try again."
          render :new
      end
  end

  def edit
      @wiki = Wiki.find(params[:id])
  end

  def update
      @wiki = Wiki.find(params[:id])
      authorize @wiki

      if @wiki.update_attributes(wiki_params)
          flash[:notice] = "Wiki was saved."
          redirect_to [@wiki]
      else
          render :edit
      end
  end

  def destroy
      @wiki = Wiki.find(params[:id])
      authorize @wiki

      if @wiki.destroy
          flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
          redirect_to [@wiki]
      else
          render :show
      end
  end

  private

  def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
  end
end
