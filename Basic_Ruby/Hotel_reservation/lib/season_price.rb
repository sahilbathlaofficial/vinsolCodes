class SeasonPrice

  attr_reader :season_name, :rate, :start_date
  attr_accessor :days, :end_date

  def initialize(season_params)
    @season_name = season_params[:occasion]
    @days = season_params[:days]
    @rate = season_params[:rate]
    @start_date = season_params[:start_date]
    @end_date = season_params[:end_date]
  end

  def price
    (days.to_i * rate.to_f)
  end

end