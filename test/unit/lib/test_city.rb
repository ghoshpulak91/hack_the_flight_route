require 'minitest'
require 'minitest/autorun'
require 'minitest/benchmark'

load_arr = ["../../../lib/city.rb"]
load_arr.each do |lib|
        require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

class TestCity < Minitest::Test
        def setup
        end

	# This tests car object creation
        def test_initialize
		number = 1
		name = "Dhaka" 
		latitude = 23.8500 
		longitude = 90.4000
		
		# valid object creation
		city = City.new(number, name, latitude, longitude)
		assert_equal(City, city.class)
		assert_equal(number, city.number)
		assert_equal(name, city.name)
		assert_equal(latitude, city.latitude)
		assert_equal(longitude, city.longitude)
	
		# invalid object creation	
		begin 	
			City.new(number, name, latitude, longitude)
		rescue Exception => e
			assert(true, "Exception was raised")
		end
	end

end
