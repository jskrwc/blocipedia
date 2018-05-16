class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    #find wiki that corresponds to id in the params passed to show, assign it to @wiki
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    # @wiki = Wiki.new
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]

# #   def create
# #     # @wiki = Wiki.new
    # @wiki = current_user.wikis.new(wiki_params)
    @wiki = Wiki.new(wiki_params)
# #     # @wiki.title = params[:wiki][:title]
# #     # @wiki.body = params[:wiki][:body]
@wiki.user = current_user


    if wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect to @wiki
    else
      flash.now[:alert] = "There was an error creating your wiki -- Please try again"
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]
    # @wiki.assign_attributes(wiki_params)  #not neede bc using @wiki.update(wiki_params) below; use if using @wiki.save below

    # if @wiki.save
    if @wiki.update(wiki_params)
      flash[:notice] = "The wiki has been succesfully updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error updating your wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting your wiki.  Please try again."
      render :show
    end
  end

end

def wiki_params
  params.require(:wiki).permit(:title, :body, :private)
end
