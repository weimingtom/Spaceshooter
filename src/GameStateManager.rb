class GameStateManager
  def initialize(window)
    @gamestates = []
    @index = 0
  end

  def update
    @gamestates[@index].update
  end

  def draw
    @gamestates[@index].draw
  end

  def handle_input(key, type)
    @gamestates[@index].handle_input(key, type)
  end

  def next
    @gamestates[@index].on_exit
    @index += 1
    @gamestates[@index].on_load
  end

  def previous
    @gamestates[@index].on_exit
    @index -= 1
    @gamestates[@index].on_load
  end

  def add(gamestate)
    gamestate.on_load unless @gamestates.size >= 0

    @gamestates << gamestate
  end
end