class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@category = Category.new
	end

	def create
		category = Category.create(params.require(:category).permit(:description))
		redirect_to categories_path
	end

end
