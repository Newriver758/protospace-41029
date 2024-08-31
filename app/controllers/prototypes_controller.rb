class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  
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
    if @prototype.destroy
      redirect_to root_path, notice: 'プロトタイプが削除されました'
    else
      redirect_to prototype_path(@prototype), alert: 'プロトタイプの削除に失敗しました'
    end
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
    @comments = @prototype.comments.includes(:user)
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
    Rails.logger.debug "Prototype: #{@prototype.inspect}"
  end

  def authorize_user!
    if @prototype.nil? || @prototype.user != current_user
      redirect_to root_path, alert: 'アクセス権限がありません'
    end
  end
end
