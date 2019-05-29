# require 'rest-client'
require 'json'
require 'pry'

result_hash = {}

def get_word_from_api#(word)
  #word = "dank"
  what_to_look_for = 'http://api.urbandictionary.com/v0/define?term={"dank"}'
  result_hash = JSON.parse(RestClient.get(what_to_look_for))
  result_hash
  #r#esults = response_hash["results"]
end

# def process_api_hash(result_hash)
#   result_hash.collect do |k,v|
#     v.each do |ary_data|
#       ary_data
#         ary_data.each do |detail, item|
#             case detail
#               when "word"
#                 your_word = "item1"
#               when "definition"
#                 your_def = "item2"
#               when "example"
#                 your_ex = "item3"
#               when "thumbs_up"
#                 rating = item
#             end
#           end
#       end
#     end
#     #results(your_word, your_definition, example)
#  end
