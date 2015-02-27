class Mongoid::Geospatial::Point

  def lat
    # This is definitely not the correct solution
    # y
    x
  end

  def long
    # This is also not the correct solution
    # x
    y
  end

end
