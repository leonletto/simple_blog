class AddCommentCounter < ActiveRecord::Migration
  def up
    #add_column :blog_posts, :comments_count, :integer, :limit => 4, :default => 0, :null => false
    #Post.all.each do |post|
    #  current_count = post.comments.length
    #  post.update_attribute(:comments_count, current_count)
  end
  u = User.new(:username => 'kskogland', :hashed_password => 'mypassword', :first_name => 'Kevin', :last_name => 'Skogland', :email => 'xyz@xyz.com', :displayname => 'Kevin S', :user_level => 9)
  u.save
  c = Comment.new(:content => "This is the content for Comment 1", :author => "Leon Letto",
                  :author_email => "leon@letto.ca", :status => 1, :post_id => 1)
  p = Post.new(:title => "first post", :content => "This is the default body for post 1", :author_id => 1, :category => "mycategory", :status => "good")
  u.posts << p
  p.comments << c
  cat = Category.new(:name => "General", :short_name => "general")
  cat.save
  cat.posts << p



  def down
    #remove_column :blog_posts, :comments_count
  end
end
