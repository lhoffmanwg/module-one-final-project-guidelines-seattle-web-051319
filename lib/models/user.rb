class User < ActiveRecord::Base
    has_many :user_words
    has_many :words, through: :user_words
end