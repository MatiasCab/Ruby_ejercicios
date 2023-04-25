class AssemblyLine
    def initialize(speed)
        @speed = speed
    end

    def production_rate_per_hour
        car_per_hour = @speed * 221
        case @speed
        when 1..4
            return car_per_hour
        when 5..8
            return car_per_hour * 0.9
        when 9
            return car_per_hour * 0.8
        when 10
            return car_per_hour * 0.77
        end
    end

    def working_items_per_minute
        (production_rate_per_hour / 60).to_i
    end
end