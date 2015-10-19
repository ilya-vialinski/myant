# NOT OPTIMIZED CODE!!! Written by Ruby beginner!
# LEVEL 3
class Player
  def play_turn(warrior)
    @exit = warrior.direction_of_stairs
    if warrior.feel(:right).captive?
      warrior.rescue!(:right)
    elsif warrior.feel(:backward).enemy? && warrior.feel(:left).enemy?
      warrior.walk!(:right)
    elsif warrior.feel.empty? && warrior.feel(:left).empty?
      warrior.walk!
    elsif warrior.feel(:left).enemy?
      warrior.attack!(:left)
    elsif warrior.feel(:left).empty?
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(:left)
      end
    elsif warrior.feel(:backward).enemy?
      warrior.attack!(:backward)
    elsif !warrior.feel(:backward).enemy?
      warrior.walk!(:backward)
    else
      warrior.rest!
    end
  end
end

# LEVEL 4
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @units.each do |u|
      if u.enemy?
        @dir_e = warrior.direction_of(u)
        break
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
        break
      else
        break
      end
    end    
    def taking_damage(warrior)
      true if warrior.health < @health
    end   
    if warrior.feel.stairs?
      warrior.walk!
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        if warrior.health < 8
          warrior.walk!(:backward)
        else
          warrior.attack!(@dir_e)
        end
      end
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        warrior.walk!(@dir_e)
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      warrior.walk!(@dir_c)
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end

# LEVEL 5
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @units.each do |u|
      if u.enemy?
        @dir_e = warrior.direction_of(u)
        break
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
        break
      else
        break
      end
    end    
    def taking_damage(warrior)
      true if warrior.health < @health
    end   
    if warrior.feel.stairs?
      warrior.walk!(:left)
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        if warrior.health < 8
          warrior.walk!(:backward)
        else
          warrior.attack!(@dir_e)
        end
      end
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        warrior.walk!(@dir_e)
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      warrior.walk!(@dir_c)
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end

# LEVEL 6
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @dir_main = nil
    @units.each do |u|
      if u.ticking?
        @dir_main = warrior.direction_of(u)
        break
      elsif u.enemy?
        @dir_e = warrior.direction_of(u)
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
      else
        break
      end
    end   
    def taking_damage(warrior)
      true if warrior.health < @health
    end   
    if @dir_main != nil && warrior.feel(@dir_main).captive?
      warrior.rescue!(@dir_main)
    elsif @dir_main != nil && !warrior.feel(@dir_main).captive?
      if warrior.feel(@dir_main).enemy?
        warrior.attack!(@dir_main)
      else
        warrior.walk!(@dir_main)
      end
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        if warrior.health < 8
          warrior.walk!(:backward)
        else
          warrior.attack!(@dir_e)
        end
      end
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        warrior.walk!(@dir_e)
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      warrior.walk!(@dir_c)
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end

# LEVEL 7
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @dir_main = nil
    @units.each do |u|
      if u.ticking?
        @dir_main = warrior.direction_of(u)
        break
      elsif u.enemy?
        @dir_e = warrior.direction_of(u)
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
      else
        break
      end
    end    
    def taking_damage(warrior)
      true if warrior.health < @health
    end   
    if @dir_main != nil && warrior.feel(@dir_main).captive?
      warrior.rescue!(@dir_main)
    elsif @dir_main != nil && !warrior.feel(@dir_main).captive?
      if warrior.feel(@dir_main).enemy?
        if warrior.feel(:left).enemy?
          warrior.bind!(:left)
        elsif warrior.feel(:right).enemy?
          warrior.bind!(:right)
        else
          warrior.attack!(@dir_main)
        end
      else
        warrior.walk!(@dir_main)
      end
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        if warrior.health < 8
          warrior.walk!
        else
          warrior.attack!(@dir_e)
        end
      end
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        warrior.walk!(@dir_e)
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      warrior.walk!(@dir_c)
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end

# LEVEL 8
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @dir_main = nil
    @space = warrior.look
    @units.each do |u|
      if u.ticking?
        @dir_main = warrior.direction_of(u)
        break
      elsif u.enemy?
        @dir_e = warrior.direction_of(u)
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
      else
        break
      end
    end    
    def boom()
      true if @space[0].enemy? && @space[1].enemy?
    end    
    def taking_damage(warrior)
      true if warrior.health < @health
    end    
    if @dir_main != nil && warrior.feel(@dir_main).captive?
      warrior.rescue!(@dir_main)
    elsif @dir_main != nil && !warrior.feel(@dir_main).captive?
      if warrior.feel(@dir_main).enemy?
        if boom()
          warrior.detonate!
        else
          warrior.attack!(@dir_main)
        end
      else
        warrior.walk!(@dir_main)
      end
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        if warrior.health < 8
          warrior.walk!
        else
          warrior.attack!(@dir_e)
        end
      end
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if taking_damage(warrior)
        warrior.walk!(@dir_e)
      elsif warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      warrior.walk!(@dir_c)
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end

# LEVEL 9
class Player
  def play_turn(warrior)
    @units = warrior.listen
    @exit = warrior.direction_of_stairs
    @dir_e = nil
    @dir_c = nil
    @dir_main = nil
    @space = warrior.look
    @units.each do |u|
      if u.ticking?
        @dir_main = warrior.direction_of(u)
        break
      elsif u.enemy?
        @dir_e = warrior.direction_of(u)
      elsif u.captive?
        @dir_c = warrior.direction_of(u)
      else
        break
      end
    end    
    def boom()
      true if @space[0].enemy? && @space[1].enemy?
    end    
    def taking_damage(warrior)
      true if warrior.health < @health
    end    
    if warrior.feel(:left).enemy?
      warrior.bind!(:left)
    elsif warrior.feel(:right).enemy?
      warrior.bind!(:right)
    elsif warrior.feel.empty? && warrior.health < 10 && @space[1].enemy?
      warrior.rest!
    elsif warrior.feel.empty? && @space[1].enemy? && @space[2].enemy?
      warrior.detonate!
    elsif @dir_main != nil && warrior.feel(@dir_main).captive?
      warrior.rescue!(@dir_main)
    elsif @dir_main != nil && !warrior.feel(@dir_main).captive?
      if warrior.feel(@dir_main).enemy?
        if boom()
          warrior.detonate!
        else
          warrior.attack!(@dir_main)
        end
      else
        warrior.walk!(@dir_main)
      end
    elsif @dir_e != nil && warrior.feel(@dir_e).enemy?
      warrior.attack!(@dir_e)
    elsif @dir_e != nil && !warrior.feel(@dir_e).enemy?
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_e)
      end
    elsif @dir_c != nil && warrior.feel(@dir_c).captive?
      warrior.rescue!(@dir_c)
    elsif @dir_c != nil && !warrior.feel(@dir_c).captive?
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk!(@dir_c)
      end
    else
      warrior.walk!(@exit)
    end
    @health = warrior.health
  end
end