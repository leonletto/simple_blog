class Category < ActiveRecord::Base
  attr_accessible :name, :short_name
  has_many :categorizations
  has_many :posts, :through => :categorizations
end
