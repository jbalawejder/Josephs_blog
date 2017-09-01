class ArticlesController < ApplicationController

  before_action :article, only: [:show, :edit]

#  before_action :require_user, except:[:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
  #    attrs = {title: params[:title], body: params[:body]}
      @article = Article.new(article_params)
      if @article.save
      redirect_to article_path(@article)
      else
      render 'new'
    end
    #  "/my_article/#{article.id}"
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    @article = Article.find(params[:id])
  #  article.update(title: params[:title], body: params[:body])
    if @article.update(article_params)
    redirect_to article_path(@article)
    else
      render 'edit'
    end
    #{}"/my_article/#{article.id}"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def vote
    Vote.create(voteable: article, vote: params[:vote])
    redirect_to article_path(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, category_ids: [])
  end

  def article
    @article = Article.find(params[:id])
  end

end
