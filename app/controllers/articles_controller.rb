class ArticlesController < ApplicationController

  def index
    @article_list = Article.all.reverse()
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = 'Article Was Deleted Successfully'
    redirect_to articles_path
  end

  def create
    #render plain: params[:article].inspect
    @article  = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = 'Article Was Created Successfully '
      redirect_to article_path(@article)
    else
      render 'new'
      # render :new also works (this renders the new template again)
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = 'Article Updated Successfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
