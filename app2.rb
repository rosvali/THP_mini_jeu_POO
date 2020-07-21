require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def menu(p1, p2)
	puts "Quelle action veux-tu effectuer ?\n"
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner\n"
	puts "attaquer un joueur en vue :"
	puts "0 - Josiane a #{p1.life_points} points de vie"
	puts "1 - José a #{p2.life_points} points de vie"
end

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------\n\n"

puts "Initialisation du joueur :"
print "Quel est ton nom de joueur > "
h1 = HumanPlayer.new(gets.chomp)
h1.show_state

puts "\nInitialisation des ennemis :"
ennemies = [p1 = Player.new("Josiane"), p2 = Player.new("José")]
p1.show_state
p2.show_state
puts "\n----------Le combat commence !-----------"

while h1.life_points > 0 && (p1.life_points > 0 || p2.life_points > 0)
	puts "\n----------Menu--------------------------"
	menu(p1, p2)
	puts "\n----------Ton tour----------------------"
	print "> "
	case gets.chomp
	when "a" then h1.search_weapon
	when "s" then h1.search_health_pack
	when "0" then h1.attacks(p1)
	when "1" then h1.attacks(p2)
	end
	sleep 2
	puts "\n----------Tours des ennemis--------------"
	ennemies.each {|player| player.attacks(h1) if player.life_points > 0}
	sleep 2
	puts "\n----------États des joueurs--------------"
	h1.show_state
	p1.show_state
	p2.show_state
	sleep 2
end

puts "\nLa partie est terminée"
puts h1.life_points > 0 ? "Bravo ! Tu as gagné la partie" : "Bouuuu tu as perdu !"

# binding.pry