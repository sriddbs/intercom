require 'json'
require_relative '../lib/customer.rb'

describe Customer do
  describe "#initialize" do
    it "initializes with attributes supplied" do
      c = Customer.new(JSON.parse('{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}'))

      expect(c.user_id).to eql(12)
      expect(c.lat).to eql("52.986375")
      expect(c.lng).to eql("-6.043701")
      expect(c.name).to eql("Christina McArdle")
    end
  end
end
