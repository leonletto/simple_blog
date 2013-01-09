class Comment < ActiveRecord::Base
  attr_accessible :content, :author, :author_email, :status, :post_id
  belongs_to :post, :counter_cache => true
end
