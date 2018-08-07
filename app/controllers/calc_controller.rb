class CalcController < ApplicationController
  def index
  end

  def broca 
    if params[:gender] == 'pria'
      @result = (params[:tinggi].to_i - 100) - ((params[:tinggi].to_i - 100) * 0.1)
    else
      @result = (params[:tinggi].to_i - 100) - ((params[:tinggi].to_i - 100) * 0.15)
    end
    render :index
  end

  def bmi 
    @bmi = params[:berat_badan].to_f / ((params[:tinggi].to_f / 100) ** 2)
    
    if @bmi >= 30.0 
      @status_bb = 'Kegemukan (Obesitas)'
    elsif @bmi >= 25.0
      @status_bb = 'Kelebihan berat badan'
    elsif @bmi >= 18.5
      @status_bb = 'Normal (Ideal)'
    else
      @status_bb = 'Kurus / Kekurang berat badan'
    end

    render :index
  end
end
