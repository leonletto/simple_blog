class CreatePosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string "title", :limit => 100, :default => "", :null => false
      t.text "content", :default => "", :null => false
      t.integer "author_id", :default => 0, :null => false
      t.string "category", :limit => 20, :default => "", :null => false
      t.string "status", :limit => 20, :default => "", :null => false
      t.integer :comments_count, :limit => 4, :default => 0, :null => false
      t.timestamps
    end

  end
end
