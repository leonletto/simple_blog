class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", :limit => 25, :default => "", :null => false
      t.string "hashed_password", :limit => 40, :default => 0, :null => false
      t.string "first_name", :limit => 25, :default => "", :null => false
      t.string "last_name", :limit => 25, :default => "", :null => false
      t.string "email", :limit => 50, :default => "", :null => false
      t.string "displayname", :limit => 50, :default => "", :null => false
      t.integer "user_level", :null => false
      t.timestamps
    end
  end
end
