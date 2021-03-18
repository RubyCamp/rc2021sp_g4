# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director < DirectorBase
    DEBUG_MODE = true

    # 初期化
    def initialize
      @enemy1_img =  Image.load("images/Same.png")
      @enemy2_img =  Image.load("images/Shathi.png")
      @map = Map.new(50, 50, 1.4, 5, 15)
      @map.set_scroll_direction(1, 1)
      @player = Player.new(10,10, player_img, @map)
      @enemies1 = Enemy_1.new(rand(400) + rand(200), rand(300) + rand(200), @enemy1_img, @map)
      @enemies2 = Enemy_2.new(rand(400) + rand(200), rand(300) + rand(200), @enemy2_img, @map)
      @player_img =  Image.load("images/Player_1.png")
      @mori_img = Image.load("images/Mori.png")
      @map = Map.new(50, 50, 1.4, 5, 15)
      @map.set_scroll_direction(1, 1)
      @player = Player.new(10, 10, @player_img, @map)

      @moris = []

      @font = Font.new(28)
      @debug_box = RenderTarget.new(32, 32, C_YELLOW)

    end

    # Scene遷移時に自動呼出しされる規約メソッド
    def reload
      @map.reload_map_array
    end

    # 1フレーム描画
    def play
      @debug_boxes = []

      if Input.key_push?(K_SPACE)
        @player.start_jump
      end

      if Input.key_push?(K_C)
        p "px: #{@player.x}"
        @moris << Harpoon.new(@player.x, @player.y, @mori_img, @map)
      end

      @map.update
      @map.draw
      @debug_boxes += @player.update(Input.x)
      @player.draw
      @enemies1.draw
      @enemies1.update
      @enemies2.draw
      @enemies2.update
      
      @moris.each do |mori|
        mori.update
        mori.draw
      end

      title_draw

      if DEBUG_MODE
        @debug_boxes.each do |pos|
          Window.draw(pos[0], pos[1], @debug_box)
        end
      end
    end

    private

    # タイトル文字列描画
    def title_draw
      Window.draw_font(50, 5, "Sample Game", @font)
    end
  end
end
