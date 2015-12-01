class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  
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
      flash[:success] = "article was sucesfully created"
      redirect_to article_path(@article)
    else #ako ne prođe verifikaciju
      render 'new'
    end
  end
  
  def show #prikaži article
    
  
  
  end
  def edit
   
  end
  def update
   
    if @article.update(article_params)
      flash[:success] = "Article was sucesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article was sucesfully destroyed"
    redirect_to articles_path
  end
  
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params #validacija parametara
      params.require(:article).permit(:title, :description)
    end
  
end