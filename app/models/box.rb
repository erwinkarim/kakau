require 'carrierwave/orm/activerecord'
class Box < ActiveRecord::Base
  belongs_to :user
  attr_accessible :kind, :name, :parent
  mount_uploader :avatar, AvatarUploader

  def self.box_child_list(parent)
    boxlist = Array.new
    children = Box.where("parent = ?", parent.id)
    children.each do |child|
      if child.kind == 'folder' then
        boxlist.push child
        boxlist.push box_child_list(child)
      else
        boxlist.push child
      end
    end
    
    return boxlist
  end
  
end
