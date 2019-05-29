class CreateUserWordsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_words do |t|
      t.integer :user_id
      t.integer :word_id
    end
  end
end