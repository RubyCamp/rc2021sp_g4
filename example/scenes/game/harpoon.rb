module Game
  class Harpoon < Sprite

    attr_accessor :x, :y

    def initialize(x, y, img, map)
      @x = x
      @y = y
      @image = img
      @image.set_color_key(C_WHITE)
      @map = map
      super(@x, @y, @image)
    end

    def update
      dx = 4
      tmp_x = @x +dx
      dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
      @x += dx
    end

    def draw
      return if self.vanished?
      Window.draw(@map.root_x + @x, @map.root_y + @y, @image)
    end
  end
end
