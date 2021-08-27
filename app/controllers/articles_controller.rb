#controllers sao classes ruby e seus metodos publicos sao acoes
class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except:[:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new #instancia mas não salva
    @article = Article.new
  end

  def create #instancia um novo article com valores para o title and body e tenta salvar
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end   
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end
  
  private 
    def article_params #utilizando isso para permitir o envio dos parametros por hash
     params.require(:article).permit(:title, :body, :status)
   end

end
