require 'pry'

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10
	end
	def show_state
		puts "#{@name} a #{life_points} points de vie"
	end
	def gets_damage(damage)
		@life_points -= damage
		puts "Le joueur #{name} a été tué !" if @life_points <= 0
	end
	def attacks(player)
		damage = compute_damage
		puts "#{@name} attaque #{player.name}"
		puts "Il lui inflige #{damage} points de dégât"
		player.gets_damage(damage)
	end
	def compute_damage
		rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(name)
		@weapon_level = 1
		super(name)
		@life_points = 100
	end
	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
	end
	def compute_damage
		rand(1..6) * @weapon_level
	end
	def search_weapon
		level = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{level}"
		puts level > @weapon_level ? "Tu gardes l'arme de niveau #{@weapon_level = level}" : "Elle est nulle, tu l'as prends pas" 
	end
	def search_health_pack
		pack = rand(1..6)
		puts "Tu n'as rien trouvé..." if pack == 1
		if pack > 1 && pack < 6
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			@life_points + 50 > 100 ? @life_points = 100 : @life_points += 50
		elsif pack == 6
			puts "Waow, tu as trouvé un pack de +80 points de vie !"
			@life_points + 80 > 100 ? @life_points = 100 : @life_points += 80
		end
	end
end