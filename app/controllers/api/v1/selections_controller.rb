class API::V1::SelectionsController < ApplicationController

	# public API accessible at /v1/selections
	def index
		selections = Selection.all

		respond_to do |format|
			format.json { render :json => selections }
		end
	end

	# public api accessible at /v1/selections/random_meal
	def random_meal
		response = {}
		response['appetizer'] = random_appetizer()
		response['entree'] = random_entree()
		response['dessert'] = random_dessert()

		response['total_cost'] = total_metric(response['appetizer'].cost, response['entree'].cost, response['dessert'].cost)
		response['total_price'] = total_metric(response['appetizer'].price, response['entree'].price, response['dessert'].price)

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