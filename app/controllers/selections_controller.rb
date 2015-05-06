class SelectionsController < ApplicationController
	def index
		@appetizers = Selection.where(category: 'appetizer').order(name: :asc)
		@entrees = Selection.where(category: 'entree').order(name: :asc)
		@desserts = Selection.where(category: 'dessert').order(name: :asc)

		puts "============="
		puts current_user
		puts "============="


	end

	def new
		@selection = Selection.new(name: 'New Selection')

		puts '============'
		puts @selection.created_at
		puts '============'
	end

	def create
		@selection = Selection.create(selection_params)
		redirect_to root_path
	end

	# Note that ID is not displayed in routing and replaced via :name (refer to selection.rb)
	def edit
		name = params[:id]
		@selection = Selection.find_by(name: name)
	end

	def update
		name = params[:id]
		@selection = Selection.find_by(name: name)
		@selection.update_attributes!(selection_params)
		redirect_to root_path
	end

	def destroy
		name = params[:id]
		selection = Selection.find_by(name: name)
		selection.destroy
		redirect_to root_path
	end

	# Strong params
	private
	def selection_params
		params.require(:selection).permit(:name, :category, :description, :cost, :price, :image_url)
	end
end
