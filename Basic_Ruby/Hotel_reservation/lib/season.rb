class Season

  attr_reader :name, :start_date, :end_date, :rate

  def initialize(season_params)
    @name = season_params[:name]
    @start_date = season_params[:start_date]
    @end_date = season_params[:end_date]
    @rate = season_params[:rate].to_f
  end

end