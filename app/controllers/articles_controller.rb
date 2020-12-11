class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def new
        # creating an instance of the Article 
        @article = Article.new
    end

    def create
        # we pass article_params to whitelist the parameter
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

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was Successfully Updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was Successfully Deleted"
        redirect_to articles_path
    end
    
  private
  # We are whitelisting the data that are comming from params.
    def article_params
        params.require(:article).permit(:title, :description)
    end
end