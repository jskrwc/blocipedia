class CollaboratorsController < ApplicationController
  include Pundit

  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])

    @collaborator = Collaborator.new
    @collaborator.user_id = params[:collaborator][:user_id]
    @collaborator.wiki_id = params[:wiki_id]


    if @collaborator.save
      flash[:notice] = "Your Collaborator has been added"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was a problem saving the collaborator -- Please try again"
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = @wiki.collaborators.find(params[:id])

    # authorize @wiki

    if collaborator.destroy
      flash[:notice] = "\"#{collaborator.user.email}\" was removed as a collaborator."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error removing collaborator.  Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

end
