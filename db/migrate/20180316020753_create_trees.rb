class CreateTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :trees do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.date :special_date

      t.timestamps

      t.index :user_id
    end
  end
end
