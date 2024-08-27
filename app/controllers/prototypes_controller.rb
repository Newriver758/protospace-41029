class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプが作成されました。'
    else
      render :new
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプが削除されました'
  end

  def edit
  
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype), notice: 'プロトタイプが更新されました'
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
