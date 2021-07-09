require_relative 'Person'
require_relative 'Hero'
require_relative 'Villain'
require_relative 'Mongolminion'
require_relative 'Jinsakai'


jin = JinSakai.new("Jin Sakai", 100, 50, 0.8)
yuna = Hero.new("Yuna", 90, 45, 0.8)
ishihara = Hero.new("Sensei Ishihara", 80, 60, 0.8)
hero_group = [yuna, ishihara]

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40, 0)
mongol_spearman = MongolSpear.new("Mongol Spearman", 120, 60, 0)
mongol_swordman = MongolSwordman.new("Mongol Swordman", 100, 50, 0)
villain_minion = [mongol_archer,  mongol_spearman, mongol_swordman]

i = 1
until (villain_minion.empty? || villain_minion.empty?) do
    puts " ================ Turn #{i} ================\n "

    puts jin
    hero_group.each do |hero|
        puts hero
    end
    puts "\n"

    villain_minion.each do |villain|
        puts villain
    end
    puts "\n"

    puts "As Jin Sakai, What do you want to do ?\n1) Attack enemy\n2) Heal Ally"
    choice = gets.chomp.to_i
    n=1
    if choice ==  1
        puts "\nWhich enemy you want to attack ?\n"
        villain_minion.each do |villain|
            puts "#{n}) #{villain.name}\n"
            n+=1
        end
        choice = gets.chomp.to_i
        choice -= 1
        other_person = villain_minion[choice]

        jin.attack(other_person)
        villain_minion.each do |villain|
            villain_minion.delete(villain) if villain.die? || villain.flee?
        end

    else
        puts "\nWhich ally you want to heal ?\n"
        hero_group.each do |hero|
            puts "#{n}) #{hero.name}\n"
            n+=1
        end
        choice = gets.chomp.to_i
        choice -= 1
        other_person = hero_group[choice]

        jin.heal(other_person)
    end
    
    hero_group.each do |hero|
        hero.attack(villain_minion[rand(villain_minion.size)])
        villain_minion.each do |villain|
            if villain.die? || villain.flee?
                villain_minion.delete(villain) 
            end
        end
    end

    villain_minion.each do |villain|
        villain.attack(hero_group[rand(hero_group.size)])
        hero_group.each do |hero|
            hero_group.delete(hero) if hero.die?
        end
    end

    if hero_group.empty?
        break
    end
    puts "\n"
    i+=1
end