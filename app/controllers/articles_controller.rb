class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def show
    @article = Article.find( params[:id] )
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if Article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :edit
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

end
