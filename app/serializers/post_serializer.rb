class PostSerializer < ActiveModel::Serializer
  attributes :id, :img_url, :caption, :likes, :comments, :created_at

  belongs_to :user

  def comments
    ActiveModel::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end

end
