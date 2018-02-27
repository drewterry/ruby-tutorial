module Blog
  module Entities
    # Entity to present comments
    class Comment < Grape::Entity
      expose :commenter
      expose :body
    end
  end
end
