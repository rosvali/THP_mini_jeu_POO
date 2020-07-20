require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

p1 = Player.new("Josiane")
p2 = Player.new("José")

while p1.life_points > 0 && p2.life_points > 0
	puts "Voici l'état de chaque joueur :"
	p1.show_state
	p2.show_state
	puts "----------"
	puts "Passons à la phase d'attaque"
	p1.attacks(p2)
	break if p2.life_points <= 0
	p2.attacks(p1)
	puts "----------"
end
binding.pry