module Game
    class Enemy < Sprite
        def initialize(x, y, img, map)
            self.x = rand(200) + 500 
            self.y = rand(200) + 100 
            self.image = img
            @map = map
            super(self.x,self.y,self.image)
        end
      
        def check_enemy_interaction
            # X軸方向の判定
            if self.x >= 0
              @collision_right = check_x_direction([@map.root_x + self.x + MapChip::CHIP_SIZE, @map.root_y + self.y + MapChip::CHIP_SIZE / 2], 1) # 右
            else
              @collision_left = check_x_direction([@map.root_x + self.x, @map.root_y + self.y + MapChip::CHIP_SIZE / 2], -1) # 左
            end
      
            # y軸方向の判定
            if self.y >= 0
              @collision_bottom = check_y_direction([@map.root_x + self.x + MapChip::CHIP_SIZE / 2, @map.root_y + self.y + MapChip::CHIP_SIZE], 1) # 下
            else
              @collision_top = check_y_direction([@map.root_x + self.x + MapChip::CHIP_SIZE / 2, @map.root_y + self.y], -1) # 上
            end

            if @collision_bottom || @collision_top || @collision_left || @collision_right
                self.vanish
            end
        end
      
          # X軸方向の移動停止判定
        def check_x_direction(win_pos, offset)
            enemy_pos = @map.convert_win_to_map(win_pos)
            chip_num = @map.get_chip_num(enemy_pos)
            chip_weight = @map.get_chip_weight(chip_num)
            if chip_weight == Map::WALL_CHIP_WEIGHT
              enemy_view = @map.convert_map_to_win(enemy_pos)
              self.x = enemy_view[0].to_i - @map.root_x - (MapChip::CHIP_SIZE * offset)
              return true
            end
                return false
        end
      
          # Y軸方向の移動停止判定
        def check_y_direction(win_pos, offset)
            enemy_pos = @map.convert_win_to_map(win_pos)
            chip_num = @map.get_chip_num(enemy_pos)
            chip_weight = @map.get_chip_weight(chip_num)
            if chip_weight == Map::WALL_CHIP_WEIGHT
              enemy_view = @map.convert_map_to_win(enemy_pos)                                       
              self.y = enemy_view[1].to_i - @map.root_y - (MapChip::CHIP_SIZE * offset)
              return true
            end
                return false
        end

        def draw
            return if self.vanished?
            Window.draw(@map.root_x + self.x, @map.root_y + self.y, self.image)
        end
    end

    class Enemy_1 < Enemy
        def check_same_map_width
            if @@dx == 0
              self.vanish
            end
        end

        def update
            @@dx = 1
            @@dy = 1         
            tmp_x = self.x - @@dx
            tmp_y = self.y - @@dy
            @@dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
            @@dy = 0 if tmp_x > @map.height - MapChip::CHIP_SIZE || tmp_y < 0
            self.x -= @@dx
            self.y -= @@dy
            check_same_map_width
            check_enemy_interaction
        end

        def hit(moris)
            self.vanish
        end
    end

    class Enemy_2 < Enemy
        def check_shachi_map_width
            if @@dx == 0
              self.vanish
            end
        end
      
        def update
            @@dx = 3
            tmp_x = self.x - @@dx
            @@dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
            self.x -= @@dx
            check_shachi_map_width
            check_enemy_interaction
        end

        def hit(moris)
            self.vanish
        end
    end
end