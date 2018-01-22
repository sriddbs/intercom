class DistanceFinder
  attr_accessor :start_gps_point, :range

  def initialize(options)
    @start_gps_point = options[:gps_coordinates]
    @range = options[:range_in_kms]
    @radius = 6371 # radius of earth
  end

  def is_in_range?(end_gps_point)
    raise ArgumentError, 'Invalid GPS point' unless gps_valid?(end_gps_point)
    raise ArgumentError, 'Range is not a valid number' unless is_number?(@range)

    distance(end_gps_point) <= @range.to_f
  end

  def distance(end_gps_point)
    raise ArgumentError, 'Invalid GPS point' unless gps_valid?(end_gps_point)

    central_angle(end_gps_point) * @radius
  end

  def central_angle(end_gps_point)
    raise ArgumentError, 'Invalid GPS point' unless gps_valid?(end_gps_point)

    lat_1 = degrees_to_radians(@start_gps_point[0])
    lng_1 = degrees_to_radians(@start_gps_point[1])
    lat_2 = degrees_to_radians(end_gps_point[0])
    lng_2 = degrees_to_radians(end_gps_point[1])
    delta_longitude = delta(lng_1, lng_2)

    Math.acos(Math.sin(lat_1) * Math.sin(lat_2) + Math.cos(lat_1) * Math.cos(lat_2) * Math.cos(delta_longitude))
  end

  def degrees_to_radians(angle)
    raise ArgumentError, 'Angle is not a valid number' unless is_number?(angle)

    angle.to_f * Math::PI/180.0
  end

  def delta(number1, number2)
    (number2 - number1).abs
  end

  def gps_valid?(gps)
    gps.kind_of?(Array) && is_number?(gps[0]) && is_number?(gps[1]) && gps.size == 2
  end

  def is_number?(string)
    true if Float(string) rescue false
  end
end
