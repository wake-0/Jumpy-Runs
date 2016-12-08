require './lib/architecture/graphicalComponent'
require './lib/architecture/position'

class ObstacleGraphic < GraphicalComponent 

    def initialize(position, window)
        super(position, window)
        
        @width = 32
        @height = 16
        @size = 2

        @image = Gosu::Image.load_tiles window, './resources/sheet.png', @width, @height, false
        # Abstract representation of the graphical component
        @rectangle = Rectangle.new(position, @width*@size, @height*@size)

        @start_x = position.x
        @end_x = @start_x + @width * @size
        @start_y = position.y
        @end_y = @start_y + @height * @size
    end

    def draw
        frame = 12
        image = @image[frame]
        image.draw @start_x, @start_y, 1, @size, @size
        @rectangle.draw(@window) if $debug_mode
    end

    def in_range?(rectangle)
        @rectangle.intersect_x?(rectangle)
    end

    def get_ground(rectangle)
        @rectangle.top_left_y
    end
end