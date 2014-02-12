#!/usr/bin/ruby
# encoding: utf-8

system('clear')
puts "Organizando la música..."

def create_dirs
	#Create Music dir
	flag=`vdir /home/profesor/ | grep music| wc -l`
	puts "flag="+flag
	if flag.to_i==0 then
		cmd="mkdir -p /home/profesor/music"
		puts cmd
		system(cmd)
		puts "¿Creado el dir?"
		exit 1
	end

	#Averiguar los nombres de los grupos
	grupos=[]
	content=`ls /home/profesor/Downloads/*`
	lines=content.split("\n")
	lines.each do |l|
		items=l.split("/")
		data=items[4].split("-")
		nombregrupo=data[0]
		nombrecancions=data[1]
		grupos << nombregrupo
	end
	puts "Estos son los grupos nuevos:"+grupos.to_s

	#Crear dir para cado grupo
	grupos.each do |g|
		flag=`vdir /home/profesor/music| grep #{g}| wc -l`
		if flag=="0" then
			system('mkdir -p /home/profesor/music/#{g}')
		end
	end
end

def move_songs
end

def refresh_stats
end

create_dirs

