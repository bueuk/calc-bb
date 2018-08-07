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

    @berat_min = 18.5 * ((params[:tinggi].to_f / 100) ** 2)
    @berat_max = 24.9 * ((params[:tinggi].to_f / 100) ** 2)
    
    if @bmi >= 30.0 
      @status_bb = '<font color="#ff3300">Kegemukan (Obesitas)</font>'
    elsif @bmi >= 25.0
      @status_bb = '<font color="#ff704d">Kelebihan berat badan</font>'
    elsif @bmi >= 18.5
      @status_bb = '<font color="#269900">Normal (Ideal)</font>'
    else
      @status_bb = '<font color="#ffffcc">Kurus</font>'
    end

    render :index
  end
end
