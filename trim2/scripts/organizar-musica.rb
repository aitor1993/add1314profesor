#!/usr/bin/ruby
# encoding: utf-8

opcion=ARGV[0]

def verbose(pText)
	#puts pText
end

def create_dirs
	verbose "[INFO] Crear directorios..."
	#Create Music dir
	flag=`vdir /home/profesor/ | grep music| wc -l`
	if flag=="0\n" then
		verbose "* Creando directorio music"
		system("mkdir -p /home/profesor/music")
		system("touch /home/profesor/music/stats.txt")
	end

	#Averiguar los nombres de los grupos
	grupos=[]
	content=`ls /home/profesor/Downloads/*`
	lines=content.split("\n")
	lines.each do |l|
		items=l.split("/")
		data=items[4].split("-")
		nombregrupo=data[0]
		nombrecancion=data[1]
		grupos << nombregrupo
	end
	verbose "* Estos son los grupos nuevos:"+grupos.to_s

	#Crear dir para cado grupo
	grupos.each do |g|
		flag=`vdir /home/profesor/music| grep #{g}| wc -l`
		if flag=="0\n" then
			verbose "* Crear directorio para #{g}"
			system("mkdir -p /home/profesor/music/#{g}")
		end
	end
end

def move_songs
	verbose "[INFO] Mover canciones..."
	
	#Averiguar los nombres de los grupos y las canciones
	content=`ls /home/profesor/Downloads/*`
	lines=content.split("\n")
	lines.each do |l|
		items=l.split("/")
		data=items[4].split("-")
		nomgrupo=data[0]
		nomcancion=l
		cmd="cp #{nomcancion} /home/profesor/music/#{nomgrupo}"
		verbose cmd
		system(cmd)
	end
end

def refresh_stats
	verbose "[INFO] calcular estádisticas..."
	system("rm /home/profesor/music/stats.txt")

	#Grupos
	grupos=[]
	content=`ls /home/profesor/music`
	lines=content.split("\n")
	lines.each { |l| grupos << l }
	verbose "* Grupos detectados: "+grupos.to_s

	#Para cada grupo, mirar sus canciones
	grupos.each do |g|
		num=`ls /home/profesor/music/#{g}| wc -l`
		cmd="echo \"#{g}:#{num.chop}\" >> /home/profesor/music/stats.txt"
		system cmd
	end
end

if opcion=="u" then
	#Borrado
	verbose "[INFO] Borrando music!!!"
	system("rm -rf /home/profesor/music")
else
	#Main
	system('clear')
	verbose "[INFO] Organizando la música..."
	create_dirs
	move_songs
	refresh_stats	
end

