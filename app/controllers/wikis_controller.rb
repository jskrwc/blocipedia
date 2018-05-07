class WikisController < ApplicationController
  
  def index
    @wiki = Wikis.all
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
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if wiki.save
      flash[:notice] = "Your Wiki has been created"
      redirect to @wiki
    else
      flash.now[:alert] = "There was an error creating your wiki -- Please try again"
      render :new
    end
  end

  def update
    @wiki = Post.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    # @post.assign_attributes(post_params)

    if @wiki.save
      flash[:notice] = "The wiki has been succesfully updated."
      redirect_to [@post.topic, @post]
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
