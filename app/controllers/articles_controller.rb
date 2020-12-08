class ArticlesController < ApplicationController

    def new
        # creating an instance of the Article 
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            #to show message that article was created
            flash[:notice] = "Article was Successfully Created"
            # will refirect to artile/show
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

  private
    def article_params
        params.require(:article).permit(:title, :description)
    end
end