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
          requires :article_params, type: Hash do
            requires :title, type: String
            requires :text, type: String
          end
          # Include a "don't save flag" for API testing
          optional :test, type: Boolean
        end
        post do
          declared_params = declared(params)
          @article = Article.new(declared_params[:article_params])

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
        route_param :article_id do
          desc 'Get specific article.'
          get do
            present Article.find(params[:article_id]), with: Blog::Entities::Article
          end

          desc 'Update article.'
          params do
            requires :article_params, type: Hash do
              optional :title, type: String
              optional :text, type: String
            end
            # Include a "don't save flag" for API testing
            optional :test, type: Boolean
          end
          patch do
            declared_params = declared(params, include_missing: false)
            @article = Article.find(params[:article_id])

            # Only save if test is false or missing
            unless declared_params[:test]
              unless @article.update(declared_params[:article_params])
                error! @article.errors, 400
              end
            end

            # Return the updated article
            present @article, with: Blog::Entities::Article
          end

          desc 'Destroy article.'
          delete do
            present Article.find(params[:article_id]).destroy, with: Blog::Entities::Article
          end

          resource :comments do
            desc 'Get all comments'
            get do
              present Article.find(params[:article_id]).comments,
                      with: Blog::Entities::Comment
            end

            desc 'Create new comment.'
            params do
              requires :comment_params, type: Hash do
                requires :commenter, type: String
                requires :body, type: String
              end
              # Include a "don't save flag" for API testing
              optional :test, type: Boolean
            end
            post do
              declared_params = declared(params)
              @article = Article.find(params[:article_id])
              @comment = @article.comments.new(declared_params[:comment_params])

              # Only save if test is false or missing
              unless declared_params[:test]
                unless @comment.save
                  error! @comment.errors, 400
                end
              end

              # Return the new article
              present @comment, with: Blog::Entities::Comment
            end

            route_param :comment_id do
              desc 'Destroy comment.'
              delete do
                @article = Article.find(params[:article_id])
                @comment = @article.comments.find(params[:comment_id])
                present @comment.destroy, with: Blog::Entities::Comment
              end
            end
          end
        end
      end
    end
  end
end
