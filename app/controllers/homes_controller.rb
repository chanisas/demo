class HomesController < ApplicationController
	def index
		@name = params[:name]
	end

	def new

	end

	def create
		@name = params[:name]
		redirect_to(homes_path(name: @name))
	end

	def search
		@keyword = params[:search]
	end
end