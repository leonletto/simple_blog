class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text "content", :default => "", :null => false
      t.string "author", :limit => 50, :default => "", :null => false
      t.string "author_email", :limit => 50, :default => "", :null => false
      t.integer "status", :null => false
      t.integer "post_id", :null => false
      t.timestamps
    end
  end
end
