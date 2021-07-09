require_relative 'Person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage, deflects_chance)
        super(name, hitpoint, attack_damage, deflects_chance)
    end

    def take_damage(damage)
        if rand() <= deflects_chance
            puts "#{@name} deflects the attack"
        else
            @hitpoint -= damage
        end
    end

    def heal(other_person)
        puts "#{@name} heals #{other_person.name}, restoring #{@heal_damage} hitpoints \n"
        other_person.get_healed(@heal_damage)
    end

    def get_healed(heal_damage)
        @hitpoint += heal_damage
    end
end


# class Jinsakai < Person
#     def deflects(other_person)
#         if rand() <= 0.8
#             other_person.attack_damage = 0
#             puts "But Jin Sakai deflects it !!! Jin Sakai receive 0 damage"
#         end
#     end
# end