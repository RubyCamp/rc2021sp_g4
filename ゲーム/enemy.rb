class Enemy < Sprite
    def hit(obj)
        vanish
    end
end

class Enemy_1 < Enemy
    def update
        self.x -= 1
        self.y -= 1
    end
end

class Enemy_2 < Enemy
    def update
        self.x -= 2
    end
end