class Word < ActiveRecord::Base
    belongs_to :userword

    def print_word_details # when user selects a word from the list, print selected headword and defnition
        # prints the headword, definition, and example
        puts "      WORD :   #{self.headword.upcase}"
        puts "DEFINITION :   #{self.definition}"
        puts "   EXAMPLE :   #{self.example}"
    end
end
