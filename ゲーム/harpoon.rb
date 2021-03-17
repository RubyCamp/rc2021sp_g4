class Harpoon < Sprite
  def initialize(x, y)
    @image = Image.load("image/Mori.png")
    super(x, y, @image)
  end

  def update
    self.x += 1
  end
end
