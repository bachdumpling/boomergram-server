class FeedSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :created_at
  
  belongs_to :user
end
