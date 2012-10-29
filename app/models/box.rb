class Box < ActiveRecord::Base
  belongs_to :user
  attr_accessible :kind, :name, :parent
end
