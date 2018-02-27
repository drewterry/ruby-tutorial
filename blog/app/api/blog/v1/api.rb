module Blog
  module V1
    ## Load the v1 API components
    class API < Grape::API
      version ['v1'], using: :path

      mount Blog::V1::Articles
    end
  end
end
