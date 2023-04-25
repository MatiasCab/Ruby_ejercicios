class Tournament
    def self.tally(input)
        header = "Team                           | MP |  W |  D |  L |  P\n"
        games_info = []
        teams = {}
        
        input_parsed = input.split("\n")
        input_parsed.each { |n| games_info << n.split(";")}
        games_info.each do |i|
            teams_points = get_teams_points(i[2])
            for a in 0..1 do
                if teams[i[a]] == nil
                teams[i[a]] = [0,0,0,0,0]
                end
                set_team_data(teams[i[a]],teams_points[a])
            end
        end
        puts teams
        teams_sorted = teams.sort_by { |_key, value| -value[-1] }.to_h

        text = header.clone
        values_tittles = ["MP", "W", "D", "L", "P"]
        teams_sorted.keys.each do |key|
            text_copy = header.clone
            text_copy[0..(key.length - 1)] = key
            index = 0
            teams_sorted[key].each do |i|
                replace_string = values_tittles[index] == "MP" ? " #{i}" : "#{i}"
                tittle_space_ajust = i >= 10 ? " " + values_tittles[index] : values_tittles[index]
                points = String(text_copy[key.length..-1])
                text_copy[key.length..-1] = points.sub(tittle_space_ajust, replace_string)
                index += 1
            end
            text.concat(text_copy)
        end
        puts text
    end

    def self.get_teams_points(teams_game)
        if teams_game == "win"
            return [3, 0]
        elsif teams_game == "draw"
            return [1, 1]
        else
            return [0, 3]
        end
    end

    def self.set_team_data(data, points)
        data[0] += 1
        data[-1] += points
        case points
        when 3
            data[1] += 1
        when 1
            data[2] += 1
        when 0
            data[3] += 1
        end
    end
    
end

Tournament.tally("Courageous Californians;Devastating Donkeys;win\nAllegoric Alaskans;Blithering Badgers;win\nDevastating Donkeys;Allegoric Alaskans;loss\nCourageous Californians;Blithering Badgers;win\nBlithering Badgers;Devastating Donkeys;draw\nAllegoric Alaskans;Courageous Californians;draw")
