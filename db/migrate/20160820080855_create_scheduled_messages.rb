class CreateScheduledMessages < ActiveRecord::Migration

   def up
    create_table :scheduled_messages do |t|
      t.integer :user_id, null: false
      t.datetime :topic_id, null: false
      t.string :content, null: false
      t.integer :status, null: false
      t.timestamps null: false
  	end
  end

  def down
    drop_table :scheduled_messages
  end
  
end
