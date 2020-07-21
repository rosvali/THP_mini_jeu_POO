require 'pry'

class Game
	attr_accessor :player, :ennemies

#Initialise les variables d'instances
	def initialize(humanplayer)
		@player = HumanPlayer.new(humanplayer)
		@ennemies = [Player.new("Ennemi1"), Player.new("Ennemi2"), Player.new("Ennemi3"), Player.new("Ennemi4")]
	end

#Retire un Player de l'array
	def kill_player(player)
		@ennemies.delete(player)
	end

#Return true ou false si le joueur a encore de la vie ou s'il reste des ennemis
	def is_still_ongoing?
		(@player.life_points > 0 && !@ennemies.none?)
	end

#Dsiplay les states de HumanPlayer et le nombre d'ennemis restants
	def show_players
		@player.show_state
		puts "Il reste #{@ennemies.length} bots restants"
	end

#Display le menu
	def menu_game
		puts "Quelle action veux-tu effectuer ?\n"
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner\n"
		puts "attaquer un joueur en vue :"
		@ennemies.each {|p| puts "#{@ennemies.index(p) + 1} - #{p.name} a #{p.life_points} points de vie" if p.life_points > 0}
	end

#Appelle une méthode en fonction du choix de HumanPlayer
	def menu_choice(choice)
		if choice == "a" || choice == "s"
			case choice
			when "a" then @player.search_weapon
			when "s" then @player.search_health_pack 
			end
		else
			@player.attacks(@ennemies[choice.to_i - 1]) if choice.to_i != 0 && @ennemies[choice.to_i - 1]
		end
		@ennemies.each {|p| kill_player(p) if p.life_points <= 0}
	end

#Les ennemis lance une attaque à HumanPlayer
	def ennemies_attack
		@ennemies.each {|p| p.attacks(@player) if p.life_points > 0}
	end

#Display les phrases de fin
	def end
		puts "La partie est terminée"
		puts @player.life_points > 0 ? "Bravo ! Tu as gagné !" : "Bouuuu ! T'as perdu.."
	end
end