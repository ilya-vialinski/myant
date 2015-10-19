# NOT OPTIMIZED CODE!!! Written by Ruby beginner!
# LEVEL 3 or 4 or 5 or 6 or 7 ( don't remember:) )

class Player
  def play_turn(warrior)
    @space = warrior.look
    if warrior.feel.enemy?
      warrior.attack!
      @health = warrior.health
    elsif warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.wall?
      warrior.pivot!
    else
      if warrior.health == 20
        warrior.walk!
        @health = warrior.health
      else
        if taking_damage(warrior)
          case warrior.health
          when 17
            warrior.walk!
          else
          warrior.walk!(:backward)
          end
        else
          warrior.rest!
        end
      end
    end
    @health = warrior.health
  end 
  def taking_damage(warrior)
    true if warrior.health < @health
  end
end

# LEVEL 8
class Player
  def play_turn(warrior)
    @captive = false
    @go = false
    @space = warrior.look
    @space.each do |space|
      @captive = true if space.captive?
    end
    @go = true if @space.all? { |e| !e.enemy? }
    if warrior.feel.empty?
      if @captive
        warrior.walk!
      else
        if @go
          warrior.walk!
        else
          warrior.shoot!
        end
      end
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      warrior.attack!
    end
  end
end

# LEVEL 9
class Player
  def play_turn(warrior)
    @enemy_back = false
    @enemy = false
    @space_back = warrior.look(:backward)
    @space = warrior.look
    @space_back.each do |space|
      @enemy_back = true if space.enemy?
    end
    @space.each do |space|
      @enemy = true if space.enemy?
    end    
    if @enemy_back
      warrior.shoot!(:backward)
    elsif @enemy
      warrior.shoot!
    elsif !@enemy
      if warrior.feel.captive?
        warrior.rescue!
      elsif warrior.feel.wall?
        warrior.pivot!
      else
        warrior.walk!
      end
    end 
  end
end