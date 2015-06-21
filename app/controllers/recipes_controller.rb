class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy] 
	
	def index
		@recipes = Recipe.all.order("created_at DESC")
	end

	def show
		respond_to do |format|
			format.html
			format.json {render json: @recipe, location: @recipe}
		end
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)

		respond_to do |format|
			if @recipe.save
			  format.html { redirect_to @recipe, notice: "Successfully created new recipe"}
			  format.json { render json: @recipe, status: :created,  location: @recipe}
			else
		   	   format.html {render 'new'}
			end
		end

	end

	def edit 
		
	end

	def update
		respond_to do |format|
			if @recipe.update(recipe_params)
				format.html {redirect_to @recipe}
				format.json { render json: @recipe, status: :updated,  location: @recipe}
			else 
				format.html {render 'edit'}
			end
		end
		
	end

	def destroy
		@recipe.destroy 
		redirect_to root_path, notice: "Successfully deleted recipe"
	end

	private 
		def find_recipe
			@recipe = Recipe.find(params[:id])
		end

		def recipe_params
			params.require(:recipe).permit(:title, :description, :image, 
										ingredients_attributes: [:id, :name, :_destroy], 
										directions_attributes: [:id, :step, :_destroy])

		end

end
