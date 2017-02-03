class Hangman
    attr_reader :phrase

    PHRASES = ["mas vale pajaro en mano que cien volando",
    	"al que madruga dios lo ayuda",
    	"no por tanto madrugar amanece mas temprano",
    	"mas sabe el diablo por viejo que por diablo"]

    def self.random_game
    	phrase_index = rand(PHRASES.length()-1)
    	self.new PHRASES[phrase_index]
    end

	def initialize phrase = nil
        if phrase.nil?
            phrase_index = rand(PHRASES.length()-1)
            @phrase = PHRASES[phrase_index]
        else 
		  @phrase = phrase
        end
        @correct_guesses = []
	end

	def show_dashes
        @phrase.chars.map { |c| 
            if @correct_guesses.include? c.downcase
                c + ' '
            else
                c != ' ' ? '_ ' : ' ' 
            end
        }.join
	end

    def guess(letter)
        if letter.length > 1 
            return "not a valid character"
        end

        if @phrase.downcase.include?(letter.downcase)
            @correct_guesses << letter.downcase
            return "excellent!"
        else
            return "miss"
        end

        return "unexepected error"
    end
end