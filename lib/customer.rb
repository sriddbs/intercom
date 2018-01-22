class Customer
  attr_accessor :user_id, :name, :lat, :lng

  def initialize customer_attrs
    @user_id = customer_attrs["user_id"]
    @name = customer_attrs["name"]
    @lat = customer_attrs["latitude"]
    @lng = customer_attrs["longitude"]
  end

  def to_s
    [user_id, name].join(" ")
  end
end
