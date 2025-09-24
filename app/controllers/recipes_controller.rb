class RecipesController < ApplicationController
  allow_unauthenticated_access only: %i[ show ]
  before_action :set_recipe, only: %i[ show edit update destroy ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      permitted = params.require(:recipe).permit(:name, :instructions, :featured_image, :remove_featured_image, ingredients: [])
      permitted[:ingredients] = permitted[:ingredients].reject(&:blank?) if permitted[:ingredients]
      permitted
    end
end
