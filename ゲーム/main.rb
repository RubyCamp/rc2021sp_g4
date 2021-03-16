require 'dxruby'
require_relative 'player'
require_relative 'enemy'

Window.width = 800
Window.height = 600
Window.caption = "Ruby合宿_4"

image = Image.load("image/Player_1.png")
image.set_color_key(C_WHITE)
enemy_image1 = Image.load("image/Same.png")
enemy_image2 = Image.load("image/Syathi.png")

player = Player.new( 100, 300, image ,3)

enemies1 = []
3.times do
	enemies1 << Enemy_1.new( rand(400) + 500, rand(200) + 200, enemy_image1)
end

enemies2 = []
5.times do
	enemies2 << Enemy_2.new( rand(400) + 500, rand(200) + 200, enemy_image2)
end

Window.loop do
    player.update
    player.draw
    enemies1.each do |enemy1|
        enemy1.update
        enemy1.draw
    end
    enemies2.each do |enemy2|
        enemy2.update
        enemy2.draw
    end
    Sprite.check(player, enemies1)
    Sprite.check(player, enemies2)
end