module Blog
  module V1
    ## Defines article API
    class Articles < Grape::API
      resource :articles do
        desc 'Gets all articles.'
        get do
          Article.all
        end

        desc 'Get specific article.'
        params do
          requires :id
        end
        get :id do
          Article.find(params[:id])
        end
      end
    end
  end
end
