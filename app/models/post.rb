class Post < ActiveRecord::Base
  attr_accessible :title, :content, :author_id, :category, :status, :created_at
  self.table_name="blog_posts"
  belongs_to :author, :class_name => "User"
  has_many :comments, :order => "created_at ASC", :dependent => :restrict
  has_many :categorizations
  has_many :categories, :through => :categorizations
end
