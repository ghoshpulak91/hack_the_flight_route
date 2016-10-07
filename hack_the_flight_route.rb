
load_arr = ["./lib/logger.rb", "./lib/city.rb", "./lib/geodesic_distance.rb", "./lib/dijkstra.rb"]
load_arr.each do |lib|
	require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

class HackTheFlightRoute
	
	def initialize()
	end

	def start 
		test_case_no = 1
		while(true)
			line = gets.chomp.strip 
			$log.info "line: #{line}"
			if line == "0 0 0"
				$log.info "end of test cases"
				break
			else
				$log.info "starting test case: #{test_case_no}"
			       	puts ""	if test_case_no != 1
			end
			
			puts "Case ##{test_case_no}"

			@city_array = []
			@city_name_to_city_number_map = {}
			@direct_flight_list = []
			n = line.split[0].to_i
			m = line.split[1].to_i
			q = line.split[2].to_i
			
			read_cities(n)
			read_direct_flight_list(m)
			execeute_query(q)
			test_case_no += 1
		end	
	end	

	def read_cities(n)
		n.times do |c|
			line = gets.chomp.strip 
			$log.info "line: #{line}"
			city_numebr = c + 1
			city_name   = line.split[0].to_s
			latitude    = line.split[1].to_f
			longitude   = line.split[2].to_f
			city_obj    = City.new(city_numebr, city_name, latitude, longitude)
			$log.info "city_obj: #{city_obj}"
			@city_array << city_obj
			@city_name_to_city_number_map[city_name] = city_numebr
		end
		$log.info "@city_array: #{@city_array}"
		$log.info "@city_name_to_city_number_map: #{@city_name_to_city_number_map}"
	end

	def read_direct_flight_list(m)
		m.times do |c|
			line = gets.chomp.strip 
			$log.info "line: #{line}"
			ai = line.split[0].to_s
			bi = line.split[1].to_s
			ai_city_number = @city_name_to_city_number_map[ai]
			bi_city_number = @city_name_to_city_number_map[bi]
			ai_city_obj    = @city_array[ai_city_number - 1]
			bi_city_obj    = @city_array[bi_city_number - 1]
			distance = get_geographical_distance_between_two_cities(ai_city_obj, bi_city_obj)
			@direct_flight_list << [ai_city_number, bi_city_number, distance]
		end
	end

	def get_geographical_distance_between_two_cities(city_obj1, city_obj2)
		distance = GeodesicDistance.find(city_obj1.latitude, city_obj1.longitude, city_obj2.latitude, city_obj2.longitude)
		return distance.round
	end

	def execeute_query(q)
		q.times do |c|
			line = gets.chomp.strip 
			$log.info "line: #{line}"
			ai = line.split[0].to_s
			bi = line.split[1].to_s
			ai_city_number = @city_name_to_city_number_map[ai]
			bi_city_number = @city_name_to_city_number_map[bi]
			dijkstra = Dijkstra.new(ai_city_number, bi_city_number, @direct_flight_list)
			minimum_distance = dijkstra.get_minimum_distance
			if minimum_distance == Float::INFINITY
				puts "no route exists"
			else
				puts "#{minimum_distance} km"
			end
		end
	end
			
end

if __FILE__ == $0
	obj = HackTheFlightRoute.new
	obj.start
end
