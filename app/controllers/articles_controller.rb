class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show
    # @article = Article.find(params[:id])
  end

  def new
    @article = Article.new # para poder render the form
  end

  def create
    @article = Article.create(article_params)

    redirect_to articles_path(@article)
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    @article.update(article_params)

    redirect_to article_path(@article)
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
