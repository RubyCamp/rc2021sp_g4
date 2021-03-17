module Game
    class Enemy
        def initialize(x, y, img, map)
            @x = rand(400) + rand(200)
            @y = rand(300) + rand(200)
            @image = img
            @map = map
        end
        
        #def hit(Mori)
         #   vanish
        #end
        

        def hit(obj)
            vanish
        end

        def draw
            Window.draw(@x, @y, @image)
        end
    end

    class Enemy_1 < Enemy
        def update
            @debug_boxes = []
            check_map_interaction
            @x -= 2
            @y -= 2
            @debug_boxes
        end
    end

    class Enemy_2 < Enemy
        def update
            @debug_boxes = []
            check_map_interaction
            @x -= 4
            @debug_boxes
        end
    end
end