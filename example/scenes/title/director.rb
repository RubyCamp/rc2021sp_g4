module Title
    class Director
        def initialize
            @font = Font.new(24)
            #@image = Image.load("images/Title.png")
        end

        def reload
        end

        def play
            Window.draw_font(300, 150, "PUSH G KEY!", @font)
            Window.draw(300, 100, @image)
            Scene.move_to(:game) if Input.key_push?(K_G)
        end
    end
end
