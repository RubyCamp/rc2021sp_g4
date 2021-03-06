module Game
  class Harpoon < Sprite

    #attr_accessor :x, :y

    def initialize(x, y, img, map)
      self.x = x
      self.y = y
      self.image = img
      # @image.set_color_key(C_WHITE)
      @map = map
      super(self.x, self.y, self.image)
    end

    def shot
    end

    # モリのマップ上の座標に対するマップチップの通過可否判定
    def check_mori_interaction
      # X軸方向の判定
      if self.x >= 0
        @collision_right = check_x_direction([@map.root_x + self.x + MapChip::CHIP_SIZE, @map.root_y + self.y + MapChip::CHIP_SIZE / 2], 1) # 右
      else
        @collision_left = check_x_direction([@map.root_x + self.x, @map.root_y + self.y + MapChip::CHIP_SIZE / 2], -1) # 右
      end
    
      # y軸方向の判定
      if self.y >= 0
        @collision_bottom = check_y_direction([@map.root_x + self.x + MapChip::CHIP_SIZE / 2, @map.root_y + self.y + MapChip::CHIP_SIZE], 1) # 下
      else
        @collision_top = check_y_direction([@map.root_x + self.x + MapChip::CHIP_SIZE / 2, @map.root_y + self.y], -1) # 上
      end
      
      if @collision_bottom || @collision_top || @collision_left || @collision_right
        self.vanish #壁に当たると消える
      end
    end

    # X軸方向の移動停止判定
    def check_x_direction(win_pos, offset)
      player_pos = @map.convert_win_to_map(win_pos)
      chip_num = @map.get_chip_num(player_pos)
      chip_weight = @map.get_chip_weight(chip_num)
      if chip_weight == Map::WALL_CHIP_WEIGHT
        player_view = @map.convert_map_to_win(player_pos)
        self.x = player_view[0].to_i - @map.root_x - (MapChip::CHIP_SIZE * offset)
        return true
      end
      # playerが波に当たると背景の波が海水に変わる処理
      if chip_weight == Map::WAVE_CHIP_WEIGHT
        @map.change_chip(player_pos, 0)
      end
      return false
    end
  
    # Y軸方向の移動停止判定
    def check_y_direction(win_pos, offset)
      player_pos = @map.convert_win_to_map(win_pos)
      chip_num = @map.get_chip_num(player_pos)
      chip_weight = @map.get_chip_weight(chip_num)
      if chip_weight == Map::WALL_CHIP_WEIGHT
        player_view = @map.convert_map_to_win(player_pos)
        self.y = player_view[1].to_i - @map.root_y - (MapChip::CHIP_SIZE * offset)
        return true
      end
      return false
    end
    
    # 画面の端に当たるとモリが消える
    def check_mori_map_width
      if @@dx == 0
        self.vanish
      end
    end

    # 画面の端に当たるとモリが消える
    def check_mori_map_width
      if @@dx == 0
        self.vanish
      end
    end

    def update
      @@dx = 4
      tmp_x = self.x + @@dx
      @@dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
      self.x += @@dx
      check_mori_interaction
      check_mori_map_width
    end

    def draw
      return if self.vanished? #vanishのときに消える
      Window.draw(@map.root_x + self.x, @map.root_y + self.y, self.image)
    end
  end
end