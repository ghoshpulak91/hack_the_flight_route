# hack_the_flight_route

This is simple ruby code to find minimum distance need to fly from one city to another using Dijkstra. 

------

## Language 

Ruby version - 2.3.1

------

## Gems 

minitest: This is needed to run unit test cases. 

## Getting started

Assuming you are using Linux OS. 

1) Clone this repository and go that directory.

~~~
$ git clone https://github.com/ghoshpulak91/hack_the_flight_route.git
$ cd hack_the_flight_route
~~~

2) Install prerequisites and setting up environment.

2.1) Install RVM and Ruby-2.3.1(Ref: http://tecadmin.net/install-ruby-on-rails-on-ubuntu/)

2.2) Set ruby-2.3.1 as default ruby version. 

~~~
$ rvm use 2.3.1 --default
$ ruby --version
~~~

2.4) Install required gems 

~~~ 
$ gem install minitest 
~~~

------

## Run the application 

To run with file input.txt

~~~
$ ruby hack_the_flight_route.rb < input.txt > output.txt
~~~

------

## Run test suite 

To run unit tests 

~~~
$ ruby ./test/unit/lib/test_city.rb
$ ruby ./test/unit/lib/test_dijkstra.rb
$ ruby ./test/unit/lib/test_geodesic_distance.rb
$ ruby ./test/unit/lib/test_logger.rb
~~~ 

To run acceptance test 

~~~
$ cd ./test/acceptance/
$ ./test.sh
~~~ 

------

## Check logs 

Log file path  

~~~
$ ./log/run.log 
~~~

If you are using Linux then you can use bellow command to check log  

~~~
$ tail -f ./log/run.log
~~~
