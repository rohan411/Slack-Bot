class CreateTopics < ActiveRecord::Migration
   def up
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.index :user_id
      t.string :content, null: false
      t.integer :status, null: false
      t.timestamps null: false
  	end
  end

  def down
    drop_table :topics
  end
end
