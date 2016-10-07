
load_arr = ["./logger.rb"]
load_arr.each do |lib|
	require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

# This is the implemetation of Dijkstra Algorithm to find minimum distance and shortest path
class Dijkstra

	# @param [Integer] start_vertex 
	# @param [Integer] end_vertex 
	# @param [Array] edges an 2d array ex: [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
	def initialize(start_vertex, end_vertex, edges)
		@start_vertex	= start_vertex
		@end_vertex 	= end_vertex
		@path 		= []
		edges 		= edges.clone
		@vertices 	= find_vertices(edges)
		edges 		= edges.unshift([@vertices.size])
		prepare(edges)
		dijkstra
	end
	
	# @retrun [Number]	
	def get_minimum_distance
		@r[@end_vertex]
	end
 	
	# @retrun [Array] retuns array of nodes 
	def get_shortest_path
		road(@end_vertex)
		@path
	end

	# @param [Array] edges an 2d array ex: [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
	def prepare(edges)
		n = edges.size - 1
		@road = Hash.new(@vertices)
		@r = Hash.new(@vertices)
		@s = Hash.new(@vertices)
		@f = Hash.new(@vertices)
		@vertices.each do |i|
			@r[i] = 0
		end
		@vertices.each do |i|
			@s[i] = 0
		end
		@vertices.each do |i|
			@f[i] = 0
		end
		@vertices.each do |i|
			@vertices.each do |j|
				if i == j
					@road[[i, j]] = 0
				else
					@road[[i, j]] = Float::INFINITY
				end
			end
		end
		(1..n).each do |i|
			x = edges[i][0]
			y = edges[i][1]
			c = edges[i][2]
			@road[[x, y]] = c
		end
	end
	
	# @param [Array] edges an 2d array ex: [[1, 2, 10], [2, 4, 15], [1, 3, 20], [3, 4, 30], [2, 5, 50], [4, 5, 30]]
	def find_vertices(edges)
		array = edges.collect{ |row| [row[0], row[1]] }
		vertices = array.uniq.zip.flatten.compact.uniq
		$log.info "vertices: #{vertices}"
		return vertices
	end

	def road(node)
		road(@f[node]) if @f[node] != 0
		@path.push(node)
	end

	def dijkstra
		min = Float::INFINITY
		pos_min = Float::INFINITY
		@vertices.each do |i|
			@r[i] = @road[[@start_vertex, i]]
			@f[i] = @start_vertex if i != @start_vertex && @r[i] < Float::INFINITY
		end
		@s[@start_vertex] = 1
		@vertices[0..@vertices.size - 2].each do
			min = Float::INFINITY
			@vertices.each do |i|
				if @s[i] == 0 && @r[i] < min
					min = @r[i]
					pos_min = i
				end
			end
			@s[pos_min] = 1
			@vertices.each do|j|
				if @s[j] == 0
					if @r[j] > @r[pos_min] + @road[[pos_min, j]]
						@r[j] = @r[pos_min] + @road[[pos_min, j]]
						@f[j] = pos_min
					end
				end
			end
		end
	end

end
