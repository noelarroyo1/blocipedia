class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user == nil || current_user.role == 'member'
      @wikis = Wiki.where(private: false)
    else
      if current_user.role == 'premium'
        @wikis = Wiki.where('private=? OR user_id=?', false, current_user.id)
      else
        if current_user.role == 'admin'
          @wikis = Wiki.all
        else
          @wikis = Wiki.where(private: false)
        end
      end
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
    @wiki = Wiki.where(id: params[:id]).first
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
 end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def user
    user = User.find(params[:id])
  end

  def authorize_user(wiki)
    # unless current_user.admin?
    #   flash[:alert] = "You must be an admin to do that."
    #   redirect_to wikis_path
    # end

    if current_user != wiki.user || current_user != admin
      flash[:alert] = "You must be an admin to do that."
      redirect_to wikis_path
    end
  end
end
