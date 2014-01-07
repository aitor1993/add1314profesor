#!/usr/bin/ruby

def bex(block)
	block.call(20)
end

b = Proc.new { |p| puts p+a }

a=1
bex b

a=2
b.call(10)

a=3
bex b
