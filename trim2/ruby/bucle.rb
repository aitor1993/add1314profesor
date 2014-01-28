#!/usr/bin/ruby
# encoding: utf-8

#Variables
PACKAGES=[ 'nano', 'wget' ]

puts "(1) Usando each"
PACKAGES.each { |p|  puts '* '+p }

puts "(2) Usando while"
i=0
while (i<PACKAGES.count)
	puts '* '+PACKAGES[i]
	i=i+1
end

puts "(3) Usando to_s"
puts PACKAGES

