#!/usr/bin/ruby
# encoding: utf-8

#Variables
ES=[ 'hola', 'adiós' ]
eo=['saluton', 'tion' ]
$en=['hello', 'bye']

system('clear')

puts "(1) Scope principal:"
puts " ES="+ES.to_s
puts " eo="+eo.to_s
puts "$en="+$en.to_s

def saludar(param1,param2)
	puts "(2) Scope def saludar"
	puts " ES="+ES.to_s
	puts "$en="+$en.to_s
	puts " p1="+param1.to_s
	puts " p2="+param2.to_s
end

saludar(eo,"konichiwa")
