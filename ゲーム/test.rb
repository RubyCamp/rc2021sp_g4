require 'dxruby'
require_relative 'player'
require_relative 'harpoon'


player = Player.new(100, 200)
Window.loop do
  player.update
  player.draw
end