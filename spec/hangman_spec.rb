require './lib/hangman'

describe Hangman do
    it "show dashes for hola mundo should return" do
        hangman = Hangman.new "Hola mundo"
        expect(hangman.show_dashes).to eq "_ _ _ _    _ _ _ _ _ "
    end

    it "show dashes for hola mundo should return" do
        hangman = Hangman.new "Chao jose"
        expect(hangman.show_dashes).to eq "_ _ _ _    _ _ _ _ "
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
    
    it "receives an a and returns _ _ a _    _ _ _ _" do 
        hangman = Hangman.new "Chao jose"

        hangman.guess('a')
        expect(hangman.show_dashes).to eq "_ _ a _    _ _ _ _ "
    end 

    it "receives an o" do 
        hangman = Hangman.new "Chao jose"

        hangman.guess('o')
        expect(hangman.show_dashes).to eq "_ _ _ o    _ o _ _ "
    end

    it "receives two letters" do 
        hangman = Hangman.new "Chao jose"

        hangman.guess('o')
        hangman.guess('a')
        expect(hangman.show_dashes).to eq "_ _ a o    _ o _ _ "
    end

    it "receives a wrong letter and returns all dashed" do 
        hangman = Hangman.new "Chao jose"

        hangman.guess('z')
        expect(hangman.show_dashes).to eq "_ _ _ _    _ _ _ _ "
    end

    it "receives a wrong letter and a correct one" do 
        hangman = Hangman.new "Chao jose"

        hangman.guess('z')
        hangman.guess('j')
        expect(hangman.show_dashes).to eq "_ _ _ _    j _ _ _ "
    end

    it "receives a correct uppercase letter and it should replace it" do 
        hangman = Hangman.new "Chao jose"
        hangman.guess('C')
        expect(hangman.show_dashes).to eq "C _ _ _    _ _ _ _ "
    end

    it "receives a correct uppercase letter and it should replace it" do 
        hangman = Hangman.new "Chao jose"
        hangman.guess('c')
        expect(hangman.show_dashes).to eq "C _ _ _    _ _ _ _ "
    end

    it "receives a number and it should do nothing" do
        hangman = Hangman.new "Chao jose"
        hangman.guess('6')
        expect(hangman.show_dashes).to eq "_ _ _ _    _ _ _ _ "
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

    it "receives not present letter it should return not present letter in missed letters" do 
        hangman = Hangman.new "Chao jose"
        result = hangman.guess('z')
        missed_letters = hangman.missed_letters()
        expect(missed_letters).to eq "z"
    end

    it "receives not present letter it should return not present letter in missed letters" do 
        hangman = Hangman.new "Chao jose"
        result = hangman.guess('X')
        missed_letters = hangman.missed_letters()
        expect(missed_letters).to eq "x"
    end

    it "receives 2 not present letters it should return all not present letter in missed letters" do 
        hangman = Hangman.new "Chao jose"
        result = hangman.guess('X')
        result = hangman.guess('Y')
        missed_letters = hangman.missed_letters()
        expect(missed_letters).to eq "x,y"
    end
    
    it "receives 2 not present letters and one present letter it should return not present letter in missed letters" do 
        hangman = Hangman.new "Chao jose"
        result = hangman.guess('X')
        result = hangman.guess('Y')
        result = hangman.guess('a')
        missed_letters = hangman.missed_letters()
        expect(missed_letters).to eq "x,y"
    end

    it "receives 3 times the same not present letter it should return one time the miss letter" do 
        hangman = Hangman.new "Chao jose"
        result = hangman.guess('x')
        result = hangman.guess('x')
        result = hangman.guess('x')
        missed_letters = hangman.missed_letters()
        expect(missed_letters).to eq "x"
    end

    it "when a game starts I have 6 remaining fail attempts" do
        hangman = Hangman.new "Hello world"
        expect(hangman.remaining_fail_attempts).to eq 6
    end

    it "when a game has started and I enter a miss letter I should have 5 remaining fail attempts" do
        hangman = Hangman.new "Hello world"
        hangman.guess("x")
        expect(hangman.remaining_fail_attempts).to eq 5
    end

    it "when a game has started and I enter twice the same miss letter I should have 5 remaining fail attempts" do
        hangman = Hangman.new "Hello world"
        hangman.guess("x")
        hangman.guess("x")
        expect(hangman.remaining_fail_attempts).to eq 5
    end

    it "when a game has started and I enter 7 different miss letters I should have 0 remaining fail attempts" do
        hangman = Hangman.new "Hello world"
        hangman.guess("x")
        hangman.guess("y")
        hangman.guess("z")
        hangman.guess("t")
        hangman.guess("u")
        hangman.guess("v")
        hangman.guess("w")
        hangman.guess("m")
        expect(hangman.remaining_fail_attempts).to eq 0
    end

    it "when a game has started game status is 'playing'" do
        hangman = Hangman.new "Hello world"
        expect(hangman.game_status).to eq :playing
    end

    it "when a game has started and I enter 6 different miss letters, I can't play anymore" do
        hangman = Hangman.new "Hello world"
        hangman.guess("x")
        hangman.guess("y")
        hangman.guess("z")
        hangman.guess("t")
        hangman.guess("m")
        hangman.guess("p")        
        expect(hangman.game_status).to eq :lost
    end

    it "when a game has started and all the letters are discovered'" do
        hangman = Hangman.new "Hello world"
        hangman.guess("H")
        hangman.guess("e")
        hangman.guess("l")
        hangman.guess("o")
        hangman.guess("w")
        hangman.guess("r")
        hangman.guess("d")        
        expect(hangman.game_status).to eq :won
    end


    # it "can enter a word that is present in the phrase" do
    #     hangman = Hangman.new "Hello world"
    #     hangman.guess('Hello')
    #     expect(hangman.show_dashes).to eq "H e l l o    _ _ _ _ _"
    # end

    it "decreases the remaning attempts when not present word is entered" do
        hangman = Hangman.new "Hello world"
        hangman.guess('cosa')
        expect(hangman.remaining_fail_attempts).to eq 5
    end

    it "decreases the remaning attempts when not present word is entered" do
        hangman = Hangman.new "Hello world"
        expect(hangman.guess('cosa')).to eq "miss"
    end

    it "decreases the remaning attempts when not present word is entered" do
        hangman = Hangman.new "Hello world"
        expect(hangman.guess('hello')).to eq "excellent!"
    end

    it "cannot enter a word with spaces" do
        hangman = Hangman.new "Hello world"
        expect(hangman.guess('Hello wo')).to eq "not a valid character"
        expect(hangman.show_dashes).to eq "_ _ _ _ _    _ _ _ _ _ "
    end

end