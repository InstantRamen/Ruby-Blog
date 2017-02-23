class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end
    
    def show
      @article = Article.find(params[:id])
    end
    
    
    def new
      @article = Article.new
    end
    
    # def create
    #   @article = Article.new
    #   @article.title = params[:article][:title]
    #   @article.body = params[:article][:body]
    #   @article.author = params[:article][:author]
    #   @article.save
    #   redirect_to article_path(@article)
    # end
    
    def create
      @article = Article.new(
        title: params[:article][:title],
        body:  params[:article][:body],
        author: params[:article][:author])
      @article.save
      redirect_to article_path(@article)
    end
    
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end
    
    def edit
      @article = Article.find(params[:id])
    end
end
