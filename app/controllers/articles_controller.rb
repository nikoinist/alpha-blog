class ArticlesController < ApplicationController
  
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
  
  
  private
    def article_params #validacija parametara
      params.require(:article).permit(:title, :description)
    end
  
end