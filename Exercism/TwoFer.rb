=begin
Write your code for the 'Two Fer' exercise in this file.
=end
class TwoFer
    def self.two_fer(name = "")
        phrase = "One for input, one for me."
        if name != ""
            phrase.sub("input", "#{name}")
        else
            phrase.sub("input", "you")
        end
    end
end

puts TwoFer.two_fer
puts TwoFer.two_fer("Alice")
puts TwoFer.two_fer("Bob")