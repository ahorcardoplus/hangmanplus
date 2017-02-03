class Hangman
    attr_reader :phrase

    PHRASES = ["mas vale pajaro en mano que 100 volando",
    	"al que madruga dios lo ayuda",
    	"no por tanto madrugar amanece mas temprano",
    	"mas sabe el diablo por viejo que por diablo"]

    def self.random_game
    	phrase_index = rand(PHRASES.length()-1)
    	self.new PHRASES[phrase_index]
    end

	def initialize phrase
		@phrase = phrase
	end

	def show_dashes
		@phrase.chars.map {|c| c != ' ' ? '_' : ' '}.join
	end
end