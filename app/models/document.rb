class Document < ActiveRecord::Base
  validates_presence_of :url, :name
  
  belongs_to :user
end
