require_relative 'Hero'

class JinSakai < Hero
    #nanti ganti jadi heal
    def initialize(name, hitpoint, attack_damage, deflects_chance)
        super(name, hitpoint, attack_damage, deflects_chance)
        @heal_damage = 20
    end


end