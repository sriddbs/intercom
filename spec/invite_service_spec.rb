require_relative '../lib/invite_service.rb'

describe InviteService do
  describe "#initialize" do
    context "with default options" do
      it "initializes with default options" do
        service = InviteService.new

        expect(service.gps_coordinates).to eql(InviteService::DEFAULT_OPTIONS[:gps_coordinates])
        expect(service.range_in_kms).to eql(InviteService::DEFAULT_OPTIONS[:range_in_kms])
      end
    end

    context "with user defined options" do
      it "initializes with parameters suppiled" do
        service = InviteService.new({ gps_coordinates: [54.1234567, 55.7654321], range_in_kms: 200 })

        expect(service.gps_coordinates).to eql([54.1234567, 55.7654321])
        expect(service.range_in_kms).to eql(200)
      end
    end
  end

  describe "#invitable_customers" do
    it "returns array of customers who can be invited" do
      f = FileReader.new(File.join(__dir__, "test.json"))
      customers = f.parse

      service = InviteService.new

      invitable_customers = service.invitable_customers(customers)

      expect(invitable_customers).to all(be_an_instance_of(Customer))
      expect(invitable_customers.size).to eql(16)
    end
  end
end
