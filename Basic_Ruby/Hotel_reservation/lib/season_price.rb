class SeasonPrice
  attr_reader :season_name, :rate, :start_date
  attr_accessor :days, :end_date
  def initialize(season_name, days, rate, start_date, end_date)
    @season_name = season_name
    @days = 0
    @rate = rate
    @start_date = start_date
    @end_date = end_date
  end
end