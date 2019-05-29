Word.destroy_all

what_to_look_for = 'http://api.urbandictionary.com/v0/define?term=fun'
response_hash = JSON.parse(RestClient.get(what_to_look_for))

response_hash["list"].each do |entry|
    headword = entry["word"]
    definition = entry["definition"]
    example = entry["example"]
    
    Word.create(headword: headword, definition: definition, example: example)

end
