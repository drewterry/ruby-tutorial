module API
  module V1
    ## Load the v1 API components
    class Base < Grape::API
      version ['v1'], using: :path

      mount API::V1::Articles
    end
  end
end
