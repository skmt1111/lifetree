class TreesController < ApplicationController
  before_action :set_tree, only: [:show, :edit, :update, :destroy]

  # GET /trees
  # GET /trees.json
  def index
    @users = User.all
  end

  # GET /trees/1
  # GET /trees/1.json
  def show

  end

  # GET /trees/new
  def new
    @tree = Tree.new
  end

  # GET /trees/1/edit
  def edit
    @tree = Tree.find(params[:id])
  end

  # POST /trees
  # POST /trees.json
  def create
    @tree = Tree.new(tree_params)
    @tree.user = current_user


    if @tree.save
      redirect_to user_url(current_user), notice: '登録しました'
    else
      render :new, notice: '登録できませんでした'
    end

  end

  # PATCH/PUT /trees/1
  # PATCH/PUT /trees/1.json
  def update
    @tree = Tree.find(params[:id])
    if @tree.update(tree_params)
      redirect_to user_url(current_user), notice: '登録しました'
    else
      render :edit, notice: '登録できませんでした'
    end
end

  # DELETE /trees/1
  # DELETE /trees/1.json
  def destroy
    @tree.destroy
    redirect_to user_url(current_user), notice: '削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tree
      @tree = Tree.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tree_params
      params.require(:tree).permit(:title, :content, :special_date)
    end
end
