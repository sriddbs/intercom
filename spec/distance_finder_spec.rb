require_relative '../lib/distance_finder.rb'

describe DistanceFinder do
  describe "#is_in_range?" do
    let(:distance_finder) { DistanceFinder.new({ gps_coordinates: [53.3381985, -6.2592576], range_in_kms: 100 }) }

    context "with invalid gps point" do
      it "raise exception" do
        expect { distance_finder.is_in_range?("abc") }.to raise_error(ArgumentError, "Invalid GPS point")
      end
    end

    context "with invalid range" do
      it "raise exception" do
        distance_finder.range = "xyz"

        expect { distance_finder.is_in_range?([54.080556, -6.361944]) }.to raise_error(ArgumentError, "Range is not a valid number")
      end
    end

    context "with valid arguments" do
      it "returns true if user is in range" do
        expect(distance_finder.is_in_range?([54.080556, -6.361944])).to eq(true)
      end

      it "returns false if user is not in range" do
        expect(distance_finder.is_in_range?([52.833502, -8.522366])).to eq(false)
      end
    end
  end

  describe "#distance" do
    let(:distance_finder) { DistanceFinder.new({ gps_coordinates: [53.3381985, -6.2592576], range_in_kms: 100 }) }

    context "with invalid gps point" do
      it "raises exception" do
        expect { distance_finder.distance("abc") }.to raise_error(ArgumentError, "Invalid GPS point")
      end
    end

    context "with valid arguments" do
      it "returns distance" do
        expect(distance_finder.distance([54.080556, -6.361944])).to eq(82.8225543182604)
      end
    end
  end

  describe "#central_angle" do
    let(:distance_finder) { DistanceFinder.new({ gps_coordinates: [53.3381985, -6.2592576], range_in_kms: 100 }) }

    context "with invalid gps point" do
      it "raises exception" do
        expect { distance_finder.central_angle("abc") }.to raise_error(ArgumentError, "Invalid GPS point")
      end
    end

    context "with valid arguments" do
      it "returns central angle" do
        expect(distance_finder.central_angle([54.080556, -6.361944])).to eq(0.012999930045245708)
      end
    end
  end

  describe "#degrees_to_radians" do
    let(:distance_finder) { DistanceFinder.new({ gps_coordinates: [53.3381985, -6.2592576], range_in_kms: 100 }) }

    context "with invalid angle" do
      it "raises exception" do
        expect { distance_finder.degrees_to_radians("abc") }.to raise_error(ArgumentError, "Angle is not a valid number")
      end
    end

    context "with valid arguments" do
      it "converts degrees to radians" do
        expect(distance_finder.degrees_to_radians(54.080556)).to eq(0.9438837635091746)
      end
    end
  end
end
