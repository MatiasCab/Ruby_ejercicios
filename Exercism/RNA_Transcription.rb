class Complement
    def self.of_dna(dna)
        complement = ""
        dna.split("").each do |i|
            case i
            when "G"
                complement.concat("C")
            when "C"
                complement.concat("G")
            when "T"
                complement.concat("A")
            when "A"
                complement.concat("U")
            end
        end
        return complement
    end
end
