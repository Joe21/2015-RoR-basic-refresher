class SelectionsController < ApplicationController
	def index
		@appetizers = Selection.where(category: 'appetizer').order(name: :asc)
		@entrees = Selection.where(category: 'entree').order(name: :asc)
		@desserts = Selection.where(category: 'dessert').order(name: :asc)
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	# Strong params
	private
	def selection_params
		params.require(:selection).permit(:name, :category, :description, :cost, :price, :image_url)
	end
end
