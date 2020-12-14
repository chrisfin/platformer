class StaticPagesController < ApplicationController
	def home
		@charges = Charge.all
	end
end
