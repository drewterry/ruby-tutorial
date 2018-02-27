module Blog
  module Entities
    # Entity to present articles
    class Article < Grape::Entity
      expose :title
      expose :text
      expose :comments, using: Blog::Entities::Comment
    end
  end
end
