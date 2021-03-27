class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: :index, :new, :show, :create
  def index
    @prototype = Prototype.all
  end


  def title_params
    params.require(:title).permit(:content, :image).merge(user_id: current_user.id)
  end

  def new
   @prototype = Prototype.new
  end

  def create
    Prototype.create(prototype_params)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    protorype.destroy
    redirect_to root_path
  end


  unless user_signed_in?
    redirect_to action: :edit
  end

  private
  def  prototype_params
    params.require(:prototype).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
end
