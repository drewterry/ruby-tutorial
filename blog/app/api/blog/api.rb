module Blog
  ## Load the various API versions
  class API < Grape::API
    prefix 'api'

    mount Blog::V1::API
  end
end
