class CreateLearningConfiguration < ActiveRecord::Migration

  def up
    create_table :learning_configurations do |t|
      t.integer :user_id, null: false
      t.integer :interval, null: false
      t.timestamps null: false
  	end
  end

  def down
    drop_table :learning_configurations
  end
  
end
