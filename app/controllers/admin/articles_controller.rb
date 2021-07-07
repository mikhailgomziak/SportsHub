module Admin
  class ArticlesController < BaseController
    before_action :parent_info, except: [:destroy]
    before_action :find_article!, except: [:index, :new, :create]

    def index
      @articles = Article.all
    end

    def show; end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_articles_path, notice: 'Article created.'
      else
        redirect_to admin_articles_path, alert: 'Unable to create article.'
      end
    end

    def update
      if @article.update(secure_params)
        redirect_to admin_articles_path, notice: 'Article updated.'
      else
        redirect_to admin_articles_path, alert: 'Unable to update articles.'
      end
    end

    def destroy
      @article.destroy
      return unless user.destroyed?

      ApplicationMailer.with(user: user).destroy_user_notify.deliver_later
      redirect_to admin_root_path
    end

    def new_object_partial_is_exist
      false
    end

    private

    def article_params
      params.require(:article).permit(:photo, :headline, :alt_text, :caption, :content, :location_id)
    end

    def find_article!
      @article = Article.find(params[:id])
    end

    def parent_info
      @locations = Location.all
    end
  end
end
