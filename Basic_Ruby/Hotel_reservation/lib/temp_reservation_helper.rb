class Range

  def intersection(other)
    return nil if (self.max < other.begin or other.max < self.begin) 
    [self.begin, other.begin].max..[self.max, other.max].min
  end

  alias_method :&, :intersection

end

module TempReservationHelper

  def add_year_to_date(date_hash)
    Date.strptime(date_hash[:date] + '-' + date_hash[:year].to_s, "%d-%m-%Y")
  end
    
end