class API::V1::SelectionsController < ApplicationController

	def index
		@selections = Selection.all

		respond_to do |format|
			format.json { render :json => @selections }
		end
	end

end