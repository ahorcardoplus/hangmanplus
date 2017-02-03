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

	it "initialize with nil phrase it should return a random phrase" do
		hangman_game = Hangman.new
		
		expect(hangman_game.phrase).to be_kind_of(String)
		expect(hangman_game.phrase).not_to eq ""
		expect(Hangman::PHRASES).to include(hangman_game.phrase)
	end
    
    it "receives an a and returns _ _ a _  _ _ _ _" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('a')
    	expect(hangman.show_dashes).to eq "_ _ a _  _ _ _ _ "
    end	

    it "receives an o" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('o')
    	expect(hangman.show_dashes).to eq "_ _ _ o  _ o _ _ "
    end

    it "receives two letters" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('o')
    	hangman.guess('a')
    	expect(hangman.show_dashes).to eq "_ _ a o  _ o _ _ "
    end

    it "receives a wrong letter and returns all dashed" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('z')
    	expect(hangman.show_dashes).to eq "_ _ _ _  _ _ _ _ "
    end

    it "receives a wrong letter and a correct one" do 
    	hangman = Hangman.new "Chao jose"

    	hangman.guess('z')
    	hangman.guess('j')
    	expect(hangman.show_dashes).to eq "_ _ _ _  j _ _ _ "
    end

    it "receives a correct uppercase letter and it should replace it" do 
    	hangman = Hangman.new "Chao jose"
    	hangman.guess('C')
    	expect(hangman.show_dashes).to eq "C _ _ _  _ _ _ _ "
    end

    it "receives a correct uppercase letter and it should replace it" do 
    	hangman = Hangman.new "Chao jose"
    	hangman.guess('c')
    	expect(hangman.show_dashes).to eq "C _ _ _  _ _ _ _ "
    end

   	it "receives a number and it should do nothing" do 
    	hangman = Hangman.new "Chao jose"
    	hangman.guess('6')
    	expect(hangman.show_dashes).to eq "_ _ _ _  _ _ _ _ "
    end

    it "receives two letters it should do nothing" do 
    	hangman = Hangman.new "Chao jose"
    	result = hangman.guess('se')
    	expect(result).to eq "not a valid character"
    end

    it "receives one letters in phrase it should be excellent" do 
    	hangman = Hangman.new "Chao jose"
    	result = hangman.guess('s')
    	expect(result).to eq "excellent!"
    end

    it "receives one letter not in phrase it should be miss" do 
    	hangman = Hangman.new "Chao jose"
    	result = hangman.guess('z')
    	expect(result).to eq "miss"
    end

    it "receives a non alphabetic character it should return not a valid character" do 
    	hangman = Hangman.new "Chao jose"
    	result = hangman.guess('%')
    	expect(result).to eq "not a valid character"
    end

end