class Diamond
    def self.make_diamond(letter)
        abc = "ABCDEFGHIJQLMNOPQRSTUVWXYZ"
        max_space = abc.index(letter)
        diamond = ""
        spaces_center = ""
        for i in 0..max_space do
            spaces = " " * (max_space - i)
            if i == 0
                diamond_line = spaces + abc[i] + spaces + "\n"
            else
                spaces_center = " " * (i == 1 ? i : spaces_center.length + 2)
                diamond_line = spaces + abc[i] + spaces_center + abc[i] + spaces + "\n"
            end
            diamond += diamond_line
        end
        diamond_lines = diamond.split("\n")
        for i in 1..max_space do
            diamond += diamond_lines[max_space - i] + "\n"
        end
        puts diamond
    end
end

Diamond.make_diamond("E")