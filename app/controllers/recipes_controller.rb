class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy] 
	def index
		
	end

	def show
		
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
	end

	def update
		
	end

	def destroy
		
	end

	private 
		def find_recipe
			@recipe = Recipes.find(params[:id])
		end

		def recipe_params
			params.require(:recipe).permit(:title, :description)
		end

end
