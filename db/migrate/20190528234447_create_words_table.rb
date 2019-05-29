class CreateWordsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :headword
      t.string :definition
      t.string :example
    end
  end
end
