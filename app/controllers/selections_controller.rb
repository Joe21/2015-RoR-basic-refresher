class SelectionsController < ApplicationController
	def index
		@selections = Selection.all
	end

	def new
		@selection = Selection.new
	end

	def create
		@selection = Selection.create(selection_param)
		redirect_to root_path
	end

	def show
		# id = params[:id]
		# @selection = Selection.find(id)

		# @selection = Selection.find(:id)
	end

	def edit
		# id = params[:id]
		# @selection = Selection.find(id)

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
