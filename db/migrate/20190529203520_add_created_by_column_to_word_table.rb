class AddCreatedByColumnToWordTable < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :created_by, :integer
  end
end
