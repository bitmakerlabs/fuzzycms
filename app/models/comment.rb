class Comment < ActiveRecord::Base
  # body :string

  belongs_to :article

  validates :article, :presence => true
end
