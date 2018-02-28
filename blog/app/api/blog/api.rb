require 'grape-swagger'

module Blog
  ## Load the various API versions
  class API < Grape::API
    prefix 'api'

    mount Blog::V1::API
    add_swagger_documentation info: {
      title: "DT's blog API"
    }
  end
end
