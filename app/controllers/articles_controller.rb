#controllers sao classes ruby e seus metodos publicos sao acoes
class ArticlesController < ApplicationController
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

  private 
    def article_params #utilizando isso para permitir o envio dos parametros por hash
     params.require(:article).permit(:title, :body)
   end

end
