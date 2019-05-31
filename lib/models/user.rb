class User < ActiveRecord::Base
    has_many :user_words
    has_many :words, through: :user_words

    def print_lexicon

        # prints a viewable numbered list of user's saved headwords
        self.words.each_with_index do |word, index|
            puts "#{index + 1}. #{word.headword.upcase}"
        end
        # returns user's word entries
    end

    def see_word_from_lexicon(num)
        # when viewer views lexicon,
        # they may select word by number
        word = self.words[num - 1]
        # returns selected word entry
        # see User Class for #print_headword_and_definition
        word.print_word_details
        word

    end

    def create_new_word(headword, definition, example)
        # Allows user to create a new word, save new word to the database
        # AND save the word to the user's own personal lexicon
        new_word = Word.create(headword: headword, definition: definition, example: example, created_by: self.id)
        UserWord.create(user: self, word: new_word)
        
        self.reload
        new_word
    end

    # PROBLEM TO PONDER
    # EDITING: Should an edit have an effect on database entries, and therefore
    # all users who have a relationship with the same word entry?
    def edit_word(word, attribute, change)
        if word.created_by == self
            word.update(attribute => change)
        else
            puts "Sorry. You can't edit this word."
        end
    end

    # user first selects to see the word, word entry is available
    # word_entry in this method refers to the word object, NOT the headword
    def delete_word_from_lexicon(word)
        # should delete the respective row from user_words
            # user_to_update = nil
            target = UserWord.all.find do |entry|
            entry.word_id == word.id
        end
        UserWord.delete(target.id)
        self.reload #refreshes user variable
    end
end
