class RatecardsController < ApplicationController
	def new
  	@ratecard = Ratecard.new
  end

  def create
  	@ratecard = Ratecard.new(ratecard_params)
  	if @ratecard.save
      redirect_to root_url
  	else
  		render 'new'
  	end
  end

	private
		def ratecard_params
			params.require(:ratecard).permit(:name, :plan, :blended_fixed, :blended_variable)
		end
end