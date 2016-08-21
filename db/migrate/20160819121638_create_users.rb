class CreateUsers < ActiveRecord::Migration
   def up
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :slack_name, null: false
      t.index  :slack_name
      t.string :email_id, null: false
      t.timestamps null: false
    end
  end

  def down
    drop_table :users
  end
end
