#!/usr/bin/ruby

EXITCOMMAND='logout'
TIMECOMMAND=`date +%H%M`

puts "Ejecutando #{$0}..."

sTime=TIMECOMMAND
puts "HoraMinuto=#{sTime}"

if "0940" < sTime and sTime < "1115" then
	puts 'Vete al descanso!!!'
	system(EXITCOMMAND)
end	


