class RecipesController < ApplicationController
  before_filter :authenticate_user_from_token!

  def index
    @recipes = Recipe.all
    render json: { recipes: @recipes }
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: { recipe: @recipe }
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      track_activity(@recipe)
      render json: { recipe: @recipe }
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      track_activity(@recipe)
      render json: { recipe: @recipe }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    ActiveRecord::Base.transaction do
      track_activity(@recipe)
      @recipe.destroy
    end
    render status:200, json: {}
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :text)
  end


end
