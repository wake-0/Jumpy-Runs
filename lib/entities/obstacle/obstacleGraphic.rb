require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class ObstacleGraphic < GraphicalComponent 

    def initialize(position, window)
        super(position, window, 32, 16, 2)
        @image = Gosu::Image.load_tiles window, './resources/sheet.png', unsized_width, unsized_height, false
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw rectangle.top_left_x, rectangle.top_left_y, 1, size_factor, size_factor
        rectangle.draw(@window) if $debug_mode
    end

    def in_range?(rect)
        rectangle.intersect_x?(rect)
    end

    def get_ground(rect)
        rectangle.top_left_y
    end
end