class TimesController < ApplicationController
	def index
		@name = params[:name]
		first_character = @name[0]
		last_character = @name.last
		@name[0] = last_character
		@length = @name.length 
		@name[@length - 1] = first_character

		@now = Time.now
	end

	def new 
	end

	def create
		@name = params[:name]
		redirect_to(times_path(name: @name))
	end
end