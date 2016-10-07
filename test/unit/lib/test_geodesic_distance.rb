require 'minitest'
require 'minitest/autorun'
require 'minitest/benchmark'

load_arr = ["../../../lib/geodesic_distance.rb"]
load_arr.each do |lib|
        require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

class TestGeodesicDistance < Minitest::Test
        def setup
        end

        def test_constant
		assert_equal(6_378.to_f, EARTH_RADIUS_KM)
		assert_equal(3.141592653589793.to_f, PI)
	end

	def test_find
		assert_equal(254.48911212410172, GeodesicDistance.find(23.85, 90.4, 22.5333, 88.3667))
		assert_equal(230.81140223814106, GeodesicDistance.find(22.25, 91.8333, 23.85, 90.4))
	end

end
