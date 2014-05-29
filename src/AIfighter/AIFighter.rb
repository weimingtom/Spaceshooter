module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def update(objects)
      @objects = objects.dup
      dodge_projectile
      # Check if must dodge closest missile
      # Line -nearly- up with target
      # Fire at target

      # If AI got property dodge_projectiles => true
      # Dodge projectiles every 0.6 seconds

      # Remove non-projectiles
      # Remove non-threathening projectiles
      # Get closest threathening projectile
      # Dodge it
    end
    
    def target(target)
      @target = target
    end

    def dodge_projectile
      projectiles = clean_from_class(@objects, Projectile, true)
      threathening_projectiles = threathening(projectiles)
      closest_projectile = closest_object(threatening_projectiles)     
    end

    def might_collide?(object)
      object = object.dup
      object.y = self.y
      rectangular_collision?(self, object)
    end

    def threatening(objects)
      threathening_projectiles = []
      objects.each do |object|
        threathening_projectiles << object if might_collide?(object)
      end

      threathening_projectiles
    end

    def clean_from_class(objects, class_type, opposite = false)
      objects = objects.dup
      objects.drop_while {|object| object.class == class_type} if opposite == false
      objects.drop_while {|object| object.class != class_type} if opposite == true
      return objects
    end

    def closest_object(objects)
      objects.min {|a, b| (a.x - self.x).abs <=> (b.x - self.x).abs}
    end
  end
end