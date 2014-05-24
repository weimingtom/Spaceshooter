class ResourceManager
  def initialize(window)
  	@window = window
    @resources = {}
  end

  def load_image(key, path)
    raise IOError, 'path must point to a existing file!' if !File.file?(path)
    @resources[key] = Gosu::Image.new(@window, path, false) if @resources[key].nil?
  end

  def get(*keys)
    @resources[key] if keys.size == 1

    keys.each do |key|
      @resources[key]
    end
  end
end