class API::V1::SelectionsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:random_meal_with_appetizer]

	# public API accessible at /api/v1/selections
	def index
		selections = Selection.all

		respond_to do |format|
			format.json { render :json => selections }
		end
	end

	# public api accessible at /api/v1/selections/random_meal
	def random_meal
		response = {}

		# Operational Data
		response['status'] = "success"
		response['type'] = "Random 3 course meal"
		response['total_cost'] = 0
		response['total_price'] = 0

		# Resource Specific Data
		response['appetizer'] = random_appetizer()
		response['entree'] = random_entree()
		response['dessert'] = random_dessert()

		# Overwrite initial operational metrics once selections randomly selected
		response['total_cost'] = total_metric(response['appetizer'].cost, response['entree'].cost, response['dessert'].cost)
		response['total_price'] = total_metric(response['appetizer'].price, response['entree'].price, response['dessert'].price)

		respond_to do |format|
			format.json { render :json => response }
		end
	end

	def random_meal_with_appetizer
		#  Redesign appetizer id validation. call counts add to range. check if within. then boom

		if Selection.find(params['appetizer_id'])
			appetizer = Selection.find(params['appetizer_id'])
			response = appetizer.name
		else
			response = "Error, invalid appetizer."
		end

		respond_to do |format|
			format.json { render :json => response }
		end
	end


	#  Helper Methods
	# ----------------------------------------------------------
	# Random Meal Methods
	# ----------------------------------------------------------
	def random_appetizer
		appetizer = Selection.where(category: 'appetizer').sample
		return appetizer
	end

	def random_entree
		entree = Selection.where(category: 'entree').sample
		return entree
	end

	def random_dessert
		dessert = Selection.where(category: 'dessert').sample
		return dessert
	end

	# ----------------------------------------------------------
	# Metric Methods
	# ----------------------------------------------------------
	def total_metric(appetizer_metric, entree_metric, dessert_metric)
		response = appetizer_metric + entree_metric + dessert_metric
		return response
	end

end