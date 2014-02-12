#!/usr/bin/ruby

#Variables
$opcion=ARGV[0]
$texto=ARGV[1]

def show
	puts $opcion+","+$texto
end

def show_param(p1,p2)
	puts p1+"=>"+p2
end


if $opcion=="1" then
	show_param($opcion, $texto)
elsif $opcion.to_i==2 then
	puts "ahora son nmeros"
end

