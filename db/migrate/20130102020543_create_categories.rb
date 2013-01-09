class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string "name", :limit => 50, :default => "", :null => false
      t.string "short_name", :limit => 30, :default => "", :null => false
      t.string "description", :default => "", :null => false
      t.timestamps
    end
    create_table :categories_posts do |t|
      t.integer "category_id", :null => false
      t.integer "post_id", :null => false
      t.timestamps
    end
    add_index :categories_posts, :category_id
    add_index :categories_posts, :post_id
  end

  def self.down
    drop_table :categories_posts
    drop_table :categories
  end
end
