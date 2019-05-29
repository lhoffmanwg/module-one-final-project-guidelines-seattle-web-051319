Word.destroy_all
User.destroy_all
UserWord.destroy_all

# what_to_look_for = 'http://api.urbandictionary.com/v0/define?term=dope'
# response_hash = JSON.parse(RestClient.get(what_to_look_for))

# response_hash["list"].each do |entry|
#     headword = entry["word"]
#     definition = entry["definition"]
#     example = entry["example"]
    
#     Word.create(headword: headword, definition: definition, example: example)
# end

jenny = User.create(name: "Jenny")
laura = User.create(name: "Laura")

# create words
snap = Word.create(headword: "snap", definition: "an expression displaying the slickness of a comment you just made", example: "Oh snap!")
burn = Word.create(headword: "burn", definition: "to make fun of someone", example: "Oh, BURN!")
dope = Word.create(headword: "dope", definition: "cool", example: "That's dope, yo")
yo = Word.create(headword: "yo", definition: "An informal address or title to one whose name is not known to another", example: "What's up, yo?")
bling = Word.create(headword: "bling", definition: "refers to the imaginary sound that is produced from light reflected by a diamond", example: "bling bling")

UserWord.create(user: jenny, word: snap)
UserWord.create(user: jenny, word: dope)
UserWord.create(user: jenny, word: yo)
# UserWord.create(user: laura, word: bling)
# UserWord.create(user: laura, word: burn)
