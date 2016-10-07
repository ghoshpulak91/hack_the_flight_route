
load_arr = ["./logger.rb"]
load_arr.each do |lib|
	require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

#This the base class for City 
class City 
	attr_reader :number, :name, :latitude, :longitude
	
	def initialize(number, name, latitude, longitude)
		@number 	= number
		@name 		= name
		@latitude 	= latitude
		@longitude 	= longitude
	end

end
