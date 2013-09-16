class Season
  attr_reader :name, :start_date, :end_date, :rate
  def initialize(occasion_name, start_date, end_date, rate)
    @name = occasion_name
    @start_date = start_date
    @end_date = end_date
    @rate = rate
  end
end
