require_relative 'Person'

class Villain < Person
    def initialize(name, hitpoint, attack_damage, deflects_chance)
        super(name, hitpoint, attack_damage, deflects_chance)
        @flee_chance = 0.5
        @flee_status = false
    end

    def take_damage(damage)
        @hitpoint -= damage
        if @hitpoint <= 50 && @hitpoint > 0
            flee if rand() < @flee_chance
        end
    end

    def flee
        @flee_status = true
        puts "#{@name} has fled the battlefield with #{@hitpoint} hitpoint left"
    end

    def flee?
        @flee_status
    end
end

