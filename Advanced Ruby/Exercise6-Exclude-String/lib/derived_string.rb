class DerivedString < String
  def exclude? substring
    !include? substring
  end
end
