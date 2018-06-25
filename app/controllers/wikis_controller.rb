class WikisController < ApplicationController

  skip_before_action :authenticate_user!, only: :index


  def index
    # @wikis = Wiki.all
    @wikis = policy_scope(Wiki)
    # authorize @wikis
  end

  def show
    #find wiki that corresponds to id in the params passed to show, assign it to @wiki
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
  #  @wiki = Wiki.find(params[:id])   use eager loading below
    @wiki = Wiki.includes(:collaborators, :users).find(params[:id])
    authorize @wiki
    current_collab_ids = @wiki.collaborators.collect(&:user_id) + [current_user.id]
    @available_users = User.where('id NOT IN (?)', current_collab_ids)
    # @available_users = User.all # need to remove current collabs and current user
  end

  def create
    # @wiki = Wiki.new
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body]

    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    authorize @wiki

    if @wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error creating your wiki -- Please try again"
      render :new
    end
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
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
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting your wiki.  Please try again."
      render :show
    end
  end

end

private
def wiki_params
  params.require(:wiki).permit(:title, :body, :private)
end
