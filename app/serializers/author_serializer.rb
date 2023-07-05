class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  has_one :profile
  has_many :posts

  class ProfileSerializer < ActiveModel::Serializer
    attributes :username, :email, :bio, :avatar_url
  end

  class PostSerializer < ActiveModel::Serializer
    attributes :title, :short_content, :tags

    def short_content
      object.content.truncate(40, omission: '...')
    end

    def tags
      object.tags.pluck(:name)
    end
  end
end
