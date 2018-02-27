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

        desc 'Create new article.'
        params do
          requires :title, type: String
          requires :text, type: String
          # Include a "don't save flag" for API testing?
          optional :test, type: Boolean
        end
        post do
          declared_params = declared(params)
          @article = Article.new(title: declared_params[:title],
                                 text: declared_params[:text])

          # Only save if test is false or missing
          unless declared_params[:test]
            unless @article.save
              error! @article.errors, 400
            end
          end

          # Return the new article
          present @article, with: Blog::Entities::Article
        end

        # Methods requiring an article id
        route_param :id do
          desc 'Get specific article.'
          get do
            present Article.find(params[:id]), with: Blog::Entities::Article
          end
=begin
          desc 'Update article.'
          params do
            requires :title, type: String
            requires :text, type: String
            # Include a "don't save flag" for API testing?
            optional :test, type: Boolean
          end
          patch do
            @article = Article.find(params[:id])

            unless @article.update(article_params)

            end

            present @article, with: Blog::Entities::Article
          end

          desc 'Destroy article.'

=end

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
