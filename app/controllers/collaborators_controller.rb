class CollaboratorsController < ApplicationController

  def create
    @collaborator = Collaborator.new(user_id: params[:collaborator][:user_id], wiki_id: params[:wiki_id])
    @wiki = Wiki.find(params[:wiki_id])

    if @collaborator.save
      flash[:notice] = "#{@collaborator.user.email} has been added as a collaborator to #{@wiki.title}"
    else
      flash[:error] = "Adding collaborator failed"
    end
      # redirect_to @wiki
      redirect_to proc { edit_wiki_url(@wiki) }
  end

  def destroy
    # @collaborator = Collaborator.find(user_id: params[:collaborator][:user_id], wiki_id: params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @wiki = Wiki.find(params[:wiki_id])

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.email} has been removed from #{@wiki.title}."
    else
      flash[:error] = "Removing collaborator failed"
    end
      redirect_to proc { edit_wiki_path(@wiki) }
  end
end
