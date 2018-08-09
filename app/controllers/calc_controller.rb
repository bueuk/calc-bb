class CalcController < ApplicationController

  def index
  end

  def bmi 
    @bmi = (params[:berat_badan].to_f / ((params[:tinggi].to_f / 100) ** 2)).round(1)

    @berat_min = (18.5 * ((params[:tinggi].to_f / 100) ** 2)).round(1)
    @berat_max = (24.9 * ((params[:tinggi].to_f / 100) ** 2)).round(1)
    
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

  def broca 
    if params[:gender] == 'pria'
      @result = ((params[:tinggi].to_f - 100) - ((params[:tinggi].to_f - 100) * 0.1)).ceil
    else
      @result = ((params[:tinggi].to_f - 100) - ((params[:tinggi].to_f - 100) * 0.15)).ceil
    end
    render :index
  end

  def kalori

    case params[:gender]
    when 'pria' 
      @bmr = 66.4730 + (13.7516 * params[:berat_badan].to_f) + (5.0033 * params[:tinggi].to_f) - (6.7550 * params[:usia].to_i)
    else
      @bmr = 655.0955 + (9.5634 * params[:berat_badan].to_f) + (1.8496 * params[:tinggi].to_f) - (4.6756 * params[:usia].to_i)
    end

    case params[:tingkat_aktivitas]
    when 'pasif'
      @akg = (@bmr * 1.2).ceil
    when 'ringan'
      @akg = (@bmr * 1.375).ceil
    when 'sedang'
      @akg = (@bmr * 1.55).ceil
    when 'berat'
      @akg = (@bmr * 1.725).ceil
    else
      @akg = (@bmr * 1.9).ceil
    end

    render :index
  end
end
