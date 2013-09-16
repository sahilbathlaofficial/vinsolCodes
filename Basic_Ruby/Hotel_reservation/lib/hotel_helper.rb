module HotelHelper

  def add_year_to_date(date_hash)
    Date.strptime(date_hash[:date] + '-' + date_hash[:year].to_s, "%d-%m-%Y")
  end

  def new_occasion?(occasion, reservation_timeline)
    (reservation_timeline.empty? || reservation_timeline[-1].season_name != occasion)
  end
  
end