module Blog
  module Entities
    # Entity to present articles
    class Index < Grape::Entity
      expose :id
      expose :title
      expose :text
    end
  end
end
