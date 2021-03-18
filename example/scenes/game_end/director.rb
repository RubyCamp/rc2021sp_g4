module Game_end
    class Director
        def initialize
            @font = Font.new(24)
        end

        def reload
        end

        def play
            Window.draw_font(100, 100, "GAME END", @font)
            
        end
    end
end
