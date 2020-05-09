class ArticlesController < ApplicationController
  def index

    articles = Article.all
    fluxs = Flux.all
    
  end
  def news
    logger = Rails.logger
    fluxs = Flux.all
    
    require 'rss'
    require 'open-uri'
    # logger = Rails.logger
    # logger.debug fluxs.inspect

      fluxs.each do |flux|
        rss = RSS::Parser.parse(open("#{flux.url}").read, false).items[0..5]
      

        rss.each do |result|
          #logger.debug result.inspect
          #logger.debug result.pubDate.inspect
          a = result.pubDate.strftime("%Y-%m-%d %H:%M:%S")
          if !Article.exists?(pub: a)
            then Article.create! :title => result.title, :summary => result.description, :url => result.link, :flux_id => flux.id, :pub => a
          end
        end
      end
    # On récupère les données de la bdd dans un json :
    articlesJson = Article.all.to_json
    fluxJson = fluxs.to_json
    logger.debug fluxJson.inspect
    logger.debug articlesJson.inspect

  end

  def new

    flux = Flux.new

  end
  def create #creer l'enregistrement
    flux = Flux.create(post_params)
  end


  def post_params  

    params.require(:flux).permit(:title,:url)
  end
  
  
end
