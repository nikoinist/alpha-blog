class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params) #kreira novi article hash sa parametrima
    if @article.save #ako prođe verifikaciju
      flash[:notice] = "article was sucesfully created"
      redirect_to article_path(@article)
    else #ako ne prođe verifikaciju
      render 'new'
    end
  end
  
  def show #prikaži article
    @article = Article.find(params[:id])
  
  
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was sucesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article was sucesfully destroyed"
    redirect_to articles_path
  end
  
  
  private
    def article_params #validacija parametara
      params.require(:article).permit(:title, :description)
    end
  
end