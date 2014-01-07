#!/usr/bin/ruby

def bex(block)
	block.call(10)
end

a=0
b = Proc.new { |p| puts p+a }

a=1
bex b

a=2
b.call(20)

a=3
bex b
