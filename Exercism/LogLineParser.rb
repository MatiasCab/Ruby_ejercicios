class LogLineParser
    def initialize(line)
        @line = line
    end

    def message
        @line.sub(" ", "¬").split("¬")[1].strip
    end

    def log_level
        @line[1..-1].split("]")[0].downcase
    end

    def reformat
        self.message.concat(" (" + self.log_level + ")")
    end
end
