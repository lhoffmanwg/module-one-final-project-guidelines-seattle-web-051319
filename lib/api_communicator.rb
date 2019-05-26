# require 'rest-client'
require 'json'
require 'pry'

def get_recepies_from_api(ingredient)
  what_to_look_for = 'http://www.recipepuppy.com/api/?q='+ingredient
  response_hash = JSON.parse(RestClient.get(what_to_look_for))
  results = response_hash["results"]
  puts results
  #binding.pry
 end
