

what_to_look_for = 'http://api.urbandictionary.com/v0/define?term={word}'
response_hash = JSON.parse(RestClient.get(what_to_look_for))

response_hash.each do |word|
  setup = word[:col name]

  word.create(colname:temp: var, .....)
