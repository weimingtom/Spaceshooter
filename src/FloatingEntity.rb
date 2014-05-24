class FloatingEntity < Entity
  def initialize(images, x, y, hp, speed, speed_damper = 1)
    super images, x, y, hp

    @velocity_x, @velocity_y = 0, 0
    @speed = speed
    @speed_damper = speed_damper
  end

  def update
    super
  end

  def move_x
    @x += @velocity_x
    @x %= GameWindow::WIDTH
    @velocity_x *= @speed_damper
  end

  def move_y
    @y += @velocity_y
    @y %= GameWindow::HEIGHT
    @velocity_y *= @speed_damper
  end

  def accelerate_left
    @velocity_x -= Gosu::offset_x(90, @speed)
  end

  def accelerate_right
    @velocity_x += Gosu::offset_x(90, @speed)
  end

  def out_of_screen?
    if @x > GameWindow::WIDTH || @x < 0 || @y > GameWindow::HEIGHT || @y < 0
      return true
    end

    return false
  end
end