module Title
    class Director
        def initialize
            @font = Font.new(24)
        end

        image = image.load("images/Title.png")

        def reload
        end

        def play
            Window.draw_font(100, 100, "DIVING", @font)
            Window.draw(100, 200, image)
        end
    end
end
