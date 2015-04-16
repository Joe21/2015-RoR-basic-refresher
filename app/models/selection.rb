class Selection < ActiveRecord::Base
	attr_accessible :name, :category, :description, :cost, :price, :image_url
end