require './lib/hangman'

describe Hangman do
	it "show dashes for hola mundo should return" do
		hangman = Hangman.new "Hola mundo"
		expect(hangman.show_dashes).to eq "____ _____"
	end

	it "show dashes for hola mundo should return" do
		hangman = Hangman.new "Chao jose"
		expect(hangman.show_dashes).to eq "____ ____"
	end

	it "return random phrase" do
		hangman_game = Hangman.random_game
		
		expect(hangman_game.phrase).to be_kind_of(String)
		expect(hangman_game.phrase).not_to eq ""
	end

end