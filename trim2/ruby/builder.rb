#!/usr/bin/ruby
# encoding: utf-8

#Variables
PACKAGES=[ 'nano', 'wget' ]
USERS=['alumno1', 'alumno2' ]
SERVICES=[ 'ssh', 'rsync' ]

PARAM1=ARGV[0]
PARAM2=ARGV[1]

def show_packages
	puts 'Mostrar los paquetes:'
	PACKAGES.each { |p| puts '* '+p }
end

def install_packages
	puts 'Instalar paquetes:'
	PACKAGES.each do |p| 
		cmd='apt-get install -y '+p
		puts '* '+cmd
		system(cmd)
	end
end

def remove_packages
	puts 'Desinstalar paquetes:'
	PACKAGES.each do |p|
		cmd='apt-get remove -y '+p
		puts '* '+cmd
		system(cmd)
	end
end

def show_users
	puts 'Mostrar los usuarios:'
	USERS.each { |u| puts '* '+u }
end

def show_services
	puts 'Mostrar los servicios:'
	SERVICES.each { |s| puts '* '+s }
end

system('clear')
if PARAM1=='packages' or PARAM1=='p'  then
	if PARAM2=='in' then
		install_packages
	elsif PARAM2=='rm' then
		remove_packages
	else
		show_packages
	end
elsif PARAM1=='users' or PARAM1=='u'  then
	show_users
elsif PARAM1=='services' or PARAM1=='s'  then
	show_services
elsif PARAM1=='help' or PARAM1=='h'  then
	puts 'Mostrar ayuda:'
end

