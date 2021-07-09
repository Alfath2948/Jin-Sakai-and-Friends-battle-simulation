class Person
    attr_reader :name, :hitpoint, :attack_damage, :deflects_chance
    # bawaan ruby biar bisa dibaca variabel nya

    def initialize(name, hitpoint, attack_damage, deflects_chance)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
        @deflects_chance = deflects_chance
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{attack_damage} damage \n"
        other_person.take_damage(@attack_damage)
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    def heal(other_person)
        puts "#{@name} heals #{other_person.name}, restoring #{heal_damage} hitpoints \n"
        other_person.take_damage(@heal_damage)
    end

    def get_healed(heal_damage)
        @hitpoint += heal_damage
    end

    def die?
        if hitpoint <= 0 
            puts "#{@name} dies"
            true
        end
    end
end