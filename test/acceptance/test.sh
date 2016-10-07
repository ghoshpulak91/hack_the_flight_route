ruby ../../hack_the_flight_route.rb < input.txt > output.txt
sdiff -s expected_output.txt output.txt
if [ $? == 0 ] ; then
	echo "passed"
else
	echo "failed"
fi
