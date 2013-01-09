class User < ActiveRecord::Base
  attr_accessible :username, :hashed_password, :first_name, :last_name, :email, :displayname, :user_level

  has_many :posts, :foreign_key => 'author_id', :order => "created_at ASC"
  has_many :recent_posts, :class_name => 'Post', :order => 'created_at ASC', :limit => 5

  def full_name
    self.first_name + " " + last_name
  end
end
