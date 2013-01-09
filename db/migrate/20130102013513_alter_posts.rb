class AlterPosts < ActiveRecord::Migration
  def up
    add_index :blog_posts, :author_id
  end


  def down
    remove_index :blog_posts, :author_id
  end
end
