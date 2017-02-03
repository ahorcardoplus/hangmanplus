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
        @missed_letters = []
        @remaining_fail_attempts = 6
        @game_status = 'playing'
	end

	def show_dashes
        @phrase.chars.map { |c| 
            if @correct_guesses.include? c.downcase
                c + ' '
            else
                c != ' ' ? '_ ' : '   ' 
            end
        }.join
	end

    def guess(letter)
        if letter.length > 1 
            return "not a valid character"
        end

        if (letter =~ /[a-z,A-Z]/).nil?
            return "not a valid character"
        end

        if @phrase.downcase.include?(letter.downcase)
            @correct_guesses << letter.downcase
            return "excellent!"
        else
            letter_to_save = letter.downcase
            unless @missed_letters.include?(letter_to_save)
                @missed_letters << letter_to_save
                @remaining_fail_attempts -= 1 if @remaining_fail_attempts > 0 
                # @game_status = failed if @remaining_fail_attempts == 0
            end
            return "miss"
        end

        return "unexepected error"
    end

    def missed_letters
        return @missed_letters.join(',')
    end

    def remaining_fail_attempts
        @remaining_fail_attempts
    end
end