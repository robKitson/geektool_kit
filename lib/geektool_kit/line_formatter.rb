
module GeektoolKit 
  module LineFormatter

    def create_line left_side, right_side = "", max_width = 30

        size_to_fill = max_width - 1 - right_side.size
        left_side[0..size_to_fill-1].ljust(size_to_fill+1, " ") + right_side
    end

  end
end