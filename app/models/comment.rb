class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article, :presence => true
end
