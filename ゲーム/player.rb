class Player < Sprite

  def initialize(x, y)
    @image = Image.load("image/Player_1.png")
    super(x, y, @image)
    @harpoons = []
  end

  def update
    self.x += 5 if Input.key_down?(K_RIGHT)
    self.x -= 5 if Input.key_down?(K_LEFT)
    self.y += 5 if Input.key_down?(K_DOWN)
    self.y -= 5 if Input.key_down?(K_SPACE)
    self.y += 2
    pushed_z if Input.key_push?(K_Z)
    pushed_x if Input.key_push?(K_X)
    pushed_c if Input.key_push?(K_C)

   

    @harpoons.each do |harpoon|
      harpoon.update
      harpoon.draw
    end
  end

 

  private

  def pushed_z
    @harpoons << Harpoon.new(self.x + 32, self.y)
  end

  def pushed_x
    @harpoons << Harpoon.new(self.x + 32, self.y)
  end

  def pushed_c
    @harpoons << Harpoon.new(self.x + 32, self.y)
  end

end