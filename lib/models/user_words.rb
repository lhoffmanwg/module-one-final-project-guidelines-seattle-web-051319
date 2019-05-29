class UserWords < ActiveRecord::Base
    belongs_to :user
    belongs_to :words
end