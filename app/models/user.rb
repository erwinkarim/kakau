class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  validates :email, :presence => true
  validates :password, :presence => true
  validates :username, :presence => true, :uniqueness => true
  has_many :boxes, :dependent => :destroy
end
