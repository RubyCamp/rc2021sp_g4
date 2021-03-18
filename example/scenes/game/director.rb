# マップエディタモジュール
module Game
  # シーン管理用ディレクタークラス
  class Director < DirectorBase
    DEBUG_MODE = true

    # 初期化
    def initialize
      @player_img =  Image.load("images/Player_1.png")
      @mori_img = Image.load("images/Mori.png")
      #@mori_img = Sprite.new( Image.load("images/Mori.png"))
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
        @moris << Harpoon.new(@player.x, @player.y, @mori_img, @map)
      end

      @map.update
      @map.draw
      @debug_boxes += @player.update(Input.x)
      @player.draw
      
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
