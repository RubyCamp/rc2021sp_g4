module Game
    class Enemy
        def initialize( x, y, img)
            @x = x
            @y = y
            @image = img
        end

 
    end

    class Enemy_1 < Enemy
        def update
            @x -= 2
            @y -= 2
        end
    end

    class Enemy_2 < Enemy
        def update
            @x -= 4
        end
    end
end