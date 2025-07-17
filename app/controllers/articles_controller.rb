class ArticlesController < ApplicationController

  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index 
    @articles = Article.all
  end

  def new 
        @article = Article.new
  end

  def edit 
    # byebug
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end

  end


  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
    # redirect_to article_path(@article)
    flash[:notice] = "Article was created successfully."
    redirect_to @article
    else
      render 'new', status: :unprocessable_entity 
  end
end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
end