require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO 3.0' !  |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------\n\n"

puts "Initialisation du joueur :"
print "Quel est ton nom de joueur > "
my_game = Game.new(gets.chomp)
my_game.show_players
puts "\n----------Le combat commence !-----------"

while my_game.is_still_ongoing?
	puts "\n----------Menu--------------------------"
	my_game.menu_game
	puts "\n----------Ton tour----------------------"
	print "> "
	my_game.menu_choice(gets.chomp)
	sleep 2
	puts "\n----------Tours des ennemis--------------"
	my_game.ennemies_attack
	sleep 2
	puts "\n----------États des joueurs--------------"
	my_game.show_players
	sleep 2
end

my_game.end

#binding.pry