require_relative './distance_finder.rb'

class InviteService

  DEFAULT_OPTIONS = {
    gps_coordinates: [53.339428, -6.257664],
    range_in_kms: 100
  }

  def initialize options={}
    options = DEFAULT_OPTIONS.merge(options)
    @distance_finder = DistanceFinder.new(options)
  end

  def invitable_customers customers
    [].tap do |customers_to_invite|
      customers.each do |c|
        customers_to_invite << c if @distance_finder.is_in_range?([c.lat, c.lng])
      end
    end.sort_by { |c| c.user_id }
  end
end
