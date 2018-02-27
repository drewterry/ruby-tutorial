module API
  module V1
    ## Defines comment API
    class Comments < Grape::API
      namespace :articles do
        route_param :article_id do
          resource :comments do
            desc 'Get all comments'
            get do
              Articles.find(param[:article_id]).comments
            end
          end
        end
      end
    end
  end
end
