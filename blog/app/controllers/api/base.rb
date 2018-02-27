module API
  ## Load the various API versions
  class Base < Grape::API
    prefix 'api'

    mount API::V1::Base
    
  end
end
