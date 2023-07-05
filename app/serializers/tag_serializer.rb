class TagSerializer < ActiveModel::Serializer
  attributes :id, :name, :posts

  def posts
    object.posts.pluck(:title)
  end
end
