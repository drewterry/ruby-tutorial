module Blog
  module V1
    # Defines article API
    class Articles < Grape::API
      resource :articles do
        desc 'Gets all articles.' do
          success Blog::Entities::Article
        end
        get do
          present Article.all, with: Blog::Entities::Index
        end

        # Methods requiring an article id
        route_param :id do
          desc 'Get specific article.'
          get do
            present Article.find(params[:id]), with: Blog::Entities::Article
          end

          resource :comments do
            desc 'Get all comments'
            get do
              present Article.find(params[:id]).comments,
                      with: Blog::Entities::Comment
            end
          end
        end
      end
    end
  end
end
