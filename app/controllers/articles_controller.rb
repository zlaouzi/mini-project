class ArticlesController < ApplicationController
def new
  @article = Article.new
 end

 def index
  @articles = Article.all
end
def create
  #render plain: params[:article].inspect
  @article = Article.new(article_params)
  @article.save
 end
private
  def article_params
   params.require(:article).permit(:title, :description)
  end
end
def edit
  @article = Article.find(params[:id])
end
def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:notice] = "Article was deleted"
  redirect_to articles_path
 end

 