# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director < DirectorBase
    DEBUG_MODE = true
    ENEMY_COUNT = 3
    # 初期化
    def initialize
      @enemy1_img =  Image.load("images/Same.png")
      @enemy2_img =  Image.load("images/Shathi.png")
      @map = Map.new(50, 50, 1.4, 5, 15)
      @map.set_scroll_direction(1, 1)
      @player = Player.new(10,10, @player_img, @map)
      @player_img =  Image.load("images/Player_1.png")
      @mori_img = Image.load("images/Mori.png")
      #@mori_img = Sprite.new( Image.load("images/Mori.png"))
      @map = Map.new(50, 50, 1.4, 5, 15)
      @map.set_scroll_direction(1, 1)
      @player = Player.new(10, 10, @player_img, @map)

      @moris = []

      @font = Font.new(28)
      @debug_box = RenderTarget.new(32, 32, C_YELLOW)
      @enemies1 = []
      ENEMY_COUNT.times do 
        @enemies1 << Enemy_1.new(rand(400) + rand(200), rand(300) + rand(200), @enemy1_img, @map)
      end
      @enemies2 = []
      ENEMY_COUNT.times do 
        @enemies2 << Enemy_2.new(rand(400) + rand(200), rand(300) + rand(200), @enemy2_img, @map)
      end
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
        @moris << Harpoon.new(@player.x, @player.y, @mori_img, @map)
      end

      @map.update
      @map.draw
      @debug_boxes += @player.update(Input.x)
      @player.draw
 
      @enemies1.each do |enemy1|
        enemy1.update
        enemy1.draw
      end
      Sprite.check(@moris, @enemies1)
      @enemies1.delete_if{|enemy1| enemy1.vanished? }

      if @enemies1.size < ENEMY_COUNT
         @enemies1 << Enemy_1.new(rand(400) + rand(200), rand(300) + rand(200), @enemy1_img, @map)
      end

      @enemies2.each do |enemy2|
        enemy2.update
        enemy2.draw
      end
      Sprite.check(@moris, @enemies2)
      @enemies2.delete_if{|enemy2| enemy2.vanished? }

      if @enemies2.size < ENEMY_COUNT
         @enemies2 << Enemy_2.new(rand(400) + rand(200) , rand(300) + rand(200), @enemy2_img, @map)
      end
      
        
      @moris.each do |mori|
        mori.update
        mori.draw
      end
      @moris.delete_if{|mori| mori.vanished? }

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
