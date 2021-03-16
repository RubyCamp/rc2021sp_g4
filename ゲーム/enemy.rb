class Enemy << Splite
    def hit(obj)
    end
end

class Enemy_1 < Enemy
    def update
        self.x += 1
        self.y += 1
    end
end

class Enemy_2 < Enemy
    def update
        self.x += 1
    end
end