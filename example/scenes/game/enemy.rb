module Game
    class Enemy < Sprite
        def initialize(x, y, img, map)
            @x = rand(400) + rand(200)
            @y = rand(300) + rand(200)
            @image = img
            @map = map
        end
      
        def check_map_interaction
            # X軸方向の判定
            if @input_x >= 0
              @collision_right = check_x_direction([@map.root_x + @x + MapChip::CHIP_SIZE, @map.root_y + @y + MapChip::CHIP_SIZE / 2], 1) # 右
            else
              @collision_left = check_x_direction([@map.root_x + @x, @map.root_y + @y + MapChip::CHIP_SIZE / 2], -1) # 左
            end
      
            # y軸方向の判定
            if @dy >= 0
              @collision_bottom = check_y_direction([@map.root_x + @x + MapChip::CHIP_SIZE / 2, @map.root_y + @y + MapChip::CHIP_SIZE], 1) # 下
            else
              @collision_top = check_y_direction([@map.root_x + @x + MapChip::CHIP_SIZE / 2, @map.root_y + @y], -1) # 上
            end

            if@collision_bottom || @collision_top || @collision_left || @collision_right
            end
        end
      
          # X軸方向の移動停止判定
        def check_x_direction(win_pos, offset)
            enemy_pos = @map.convert_win_to_map(win_pos)
            chip_num = @map.get_chip_num(enemy_pos)
            chip_weight = @map.get_chip_weight(chip_num)
            if chip_weight == Map::WALL_CHIP_WEIGHT
              enemy_view = @map.convert_map_to_win(enemy_pos)
              @debug_boxes << enemy_view if Director::DEBUG_MODE
              stop_x_direction
              @x = enemy_view[0].to_i - @map.root_x - (MapChip::CHIP_SIZE * offset)
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
              @debug_boxes << enemy_view if Director::DEBUG_MODE
              stop_y_direction
              @y = enemy_view[1].to_i - @map.root_y - (MapChip::CHIP_SIZE * offset)
              return true
            end
                return false
        end

        def hit
            vanish
        end

        def draw
            Window.draw(@map.root_x + @x, @map.root_y + @y, @image)
        end
    end

    class Enemy_1 < Enemy
        def update
            dx = 1
            dy = 1         
            tmp_x = @x - dx
            tmp_y = @y - dy
            dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
            dy = 0 if tmp_x > @map.height - MapChip::CHIP_SIZE || tmp_y < 0
            @x -= dx
            @y -= dy
        end
    end

    class Enemy_2 < Enemy
        def update
            dx = 4
            tmp_x = @x - dx
            dx = 0 if tmp_x > @map.width - MapChip::CHIP_SIZE || tmp_x < 0
            @x -= dx
        end
    end
end