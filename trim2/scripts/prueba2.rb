#!/usr/bin/ruby

#Variables
fichero=ARGV[0]

system("echo hola")
contenido=`cat #{fichero}`
lineas=contenido.split("\n")

puts lineas

i=0
lineas.each do |l|
	i=i+1
	puts "Linea "+i.to_s+" = "+l
end

