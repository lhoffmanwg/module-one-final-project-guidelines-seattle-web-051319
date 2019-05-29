require 'pry'
require 'rest-client'
require 'json'

def api_fetch
    puts "HITTING API"
    what_to_look_for = 'http://api.urbandictionary.com/v0/define?term=fun'
    response_hash = JSON.parse(RestClient.get(what_to_look_for))
    binding.pry

end

Pry.start
0