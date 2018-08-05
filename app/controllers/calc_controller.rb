class CalcController < ApplicationController
  def index
  end

  def new
		#render plain: params.inspect
      if params[:gender] == 'pria'
        @result = (params[:tinggi].to_i - 100) - ((params[:tinggi].to_i - 100) * 0.1)
        @bmi = @result / ((params[:tinggi].to_f / 100) ** 2)
      else
        @result = (params[:tinggi].to_i - 100) - ((params[:tinggi].to_i - 100) * 0.15)
        @bmi = @result / ((params[:tinggi].to_f / 100) ** 2)
      end
			render :index
  end
end
