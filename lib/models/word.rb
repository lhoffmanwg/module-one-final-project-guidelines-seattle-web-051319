class Word < ActiveRecord::Base
    belongs_to :userword

    # has_many :user_words
    # has_many :users, through: :user_words????


    # def self.search_by_headword(user_input)
    #     # Probably doesn't work. Needs to search database AND api
    #     # allows user to search for a word by headword
    #     # if word exists
    #         # prints headword and definition
    #         # returns word entry
    #     # if not
    #         # prompt user to search another word

    #     Word.all.each do |word|
    #         if word.headword.downcase = user_input.downcase
    #             word.print_headword_and_definition
    #             word
    #         else
    #             # prompt user to search again
    #         end
    #     end
    # end

    def print_word_details # when user selects a word from the list, print selected headword and defnition
        # prints the headword, definition, and example
        puts "      word: #{self.headword.upcase}"
        puts "definition: #{self.definition}"
        puts "   example: #{self.example}"
    end

end
