require './lib/hangman'

describe Hangman do
	it "show dashes for hola mundo should return" do
		hangman = Hangman.new "Hola mundo"
		expect(hangman.show_dashes).to eq "_ _ _ _  _ _ _ _ _ "
	end

	it "show dashes for hola mundo should return" do
		hangman = Hangman.new "Chao jose"
		expect(hangman.show_dashes).to eq "_ _ _ _  _ _ _ _ "
	end

	it "return random phrase" do
		hangman_game = Hangman.random_game
		
		expect(hangman_game.phrase).to be_kind_of(String)
		expect(hangman_game.phrase).not_to eq ""
		expect(Hangman::PHRASES).to include(hangman_game.phrase)
	end
    
    it "receives letters" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('a')
    	expect(hangman.show_dashes).to eq "_ _ a _  _ _ _ _ "
    end	

end