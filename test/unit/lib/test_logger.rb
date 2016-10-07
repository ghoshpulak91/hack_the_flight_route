require 'minitest'
require 'minitest/autorun'
require 'minitest/benchmark'

load_arr = ["../../../lib/logger.rb"]
load_arr.each do |lib|
        require File.expand_path(File.dirname(__FILE__)+"/"+lib)
end

class TestLogger < Minitest::Test
        def setup
        end

	def test_logger
		assert_equal(Logger, $log.class)
		assert_equal(Logger::INFO, $log.level)
		assert_equal(true, File.directory?(File.expand_path(File.dirname(__FILE__)+"/../../../log/")))
		assert_equal(true, File.file?(File.expand_path(File.dirname(__FILE__)+"/../../../log/run.log")))
	end

end
