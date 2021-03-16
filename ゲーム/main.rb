require 'dxruby'
require_relative 'player.rb'

Window.width = 800
Window.height = 600
Window.caption = "Ruby合宿_4"

Window.loop do
    player.update
    player.draw

    Sprite.check(player, Enemy.collection)
end