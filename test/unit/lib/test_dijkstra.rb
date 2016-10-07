require 'minitest'
require 'minitest/autorun'
require 'minitest/benchmark'

load_arr = ["../../../lib/dijkstra.rb"]
load_arr.each do |lib|
        require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

class TestDijkstra < Minitest::Test
        def setup
        end

	def test_find_vertices
		edges = [
				[1, 2, 10], 
				[2, 4, 15], 
				[1, 3, 20], 
				[3, 4, 30], 
				[2, 5, 50], 
				[4, 5, 30]
			]
		dijkstra = Dijkstra.new(1, 4, edges)
		assert_equal([1,2,4,3,5], dijkstra.find_vertices(edges))

		edges = [
				[1, 2, 10], 
				[2, 4, 15], 
				[1, 3, 20], 
				[3, 4, 30], 
				[2, 5, 50], 
				[4, 5, 30], 
				[5, 10, 20], 
				[7, 20, 50], 
				[9, 20, 30]
		]
		dijkstra = Dijkstra.new(1, 7, edges)
		assert_equal([1, 2, 4, 3, 5, 10, 7, 20, 9], dijkstra.find_vertices(edges))
	end

	def test_get_minimum_distance
		edges = [
			[1, 2, 10], 
			[2, 4, 15], 
			[1, 3, 20],
			[3, 4, 30], 
			[2, 5, 50], 
			[4, 5, 30],
			[2, 3, 40], 
			[4, 6, 25], 
			[5, 6, 15],
			[4, 7, 50], 
			[3, 8, 70], 
			[5, 8, 25]
		]
		dijkstra = Dijkstra.new(1, 4, edges)
		assert_equal(25, dijkstra.get_minimum_distance)

		dijkstra = Dijkstra.new(1, 5, edges)
		assert_equal(55, dijkstra.get_minimum_distance)

		dijkstra = Dijkstra.new(2, 5, edges)
		assert_equal(45, dijkstra.get_minimum_distance)

		dijkstra = Dijkstra.new(1, 8, edges)
		assert_equal(80, dijkstra.get_minimum_distance)

		dijkstra = Dijkstra.new(1, 1, edges)
		assert_equal(0, dijkstra.get_minimum_distance)
	end

	def test_get_get_shortest_path
		edges = [
				[1, 2, 10], 
				[2, 4, 15], 
				[1, 3, 20],
  				[3, 4, 30], 
				[2, 5, 50], 
				[4, 5, 30],
	     			[2, 3, 40], 
				[4, 6, 25], 
				[5, 6, 15],
	          		[4, 7, 50], 
				[3, 8, 70], 
				[5, 8, 25]
			]
		dijkstra = Dijkstra.new(1, 4, edges)
		assert_equal([1, 2, 4], dijkstra.get_shortest_path)

		dijkstra = Dijkstra.new(1, 5, edges)
		assert_equal([1, 2, 4, 5], dijkstra.get_shortest_path)

		dijkstra = Dijkstra.new(2, 5, edges)
		assert_equal([2, 4, 5], dijkstra.get_shortest_path)

		dijkstra = Dijkstra.new(1, 8, edges)
		assert_equal([1, 2, 4, 5, 8], dijkstra.get_shortest_path)

		dijkstra = Dijkstra.new(1, 1, edges)
		assert_equal([1], dijkstra.get_shortest_path)
	end
end
