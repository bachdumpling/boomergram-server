class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar_url, :follower_count, :following_count, :post_count, :following_id
  
  has_many :posts
end
