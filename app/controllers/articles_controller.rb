#controllers sao classes ruby e seus metodos publicos sao acoes
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
