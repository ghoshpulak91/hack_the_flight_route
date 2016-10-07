
load_arr = ["./logger.rb"]
load_arr.each do |lib|
	require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

EARTH_RADIUS_KM =  6_378.to_f # km
PI = 3.141592653589793.to_f 

RAD_PER_DEG = (PI/180).to_f

module GeodesicDistance
	
	def self.find(latitude1, longitude1, latitude2, longitude2)
		$log.info "point1: (#{latitude1}, #{longitude1}), point2: (#{latitude2}, #{longitude2})"	
		dlon = longitude2 - longitude1  
		dlat = latitude2 - latitude1  
		dlon_rad = dlon * RAD_PER_DEG  
		dlat_rad = dlat * RAD_PER_DEG  
		latitude1_rad = latitude1 * RAD_PER_DEG  
		longitude1_rad = longitude1 * RAD_PER_DEG  
		latitude2_rad = latitude2 * RAD_PER_DEG  
		longitude2_rad = longitude2 * RAD_PER_DEG  
		a = Math.sin(dlat_rad/2)**2 + Math.cos(latitude1_rad) * Math.cos(latitude2_rad) * Math.sin(dlon_rad/2)**2  
		c = 2 * Math.asin( Math.sqrt(a))  
		distance_km = EARTH_RADIUS_KM * c
		$log.info "distance_km: #{distance_km}"
		return distance_km
	end  

end
