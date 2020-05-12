class ArticlesController < ApplicationController
  skip_forgery_protection
  
  def read
    logger = Rails.logger
    flux = Flux.find(params[:flux_id])
    require 'rss'
    require 'open-uri'
    # logger = Rails.logger
    # logger.debug fluxs.inspect
    rss = RSS::Parser.parse(open("#{flux.url}").read, false).items[0..30]
    rss.each do |result|
      a = result.pubDate.strftime("%Y-%m-%d %H:%M:%S")
      if !Article.exists?(pub: a)
        then Article.create! :title => result.title, :summary => result.description, :url => result.link, :flux_id => flux.id, :pub => a
      end
    end
    
    # On récupère les données de la bdd dans un json :
    articlesJson = Article.where(flux_id: flux.id).to_json
    render :json => articlesJson


  end

  def update
    article = Article.find(params[:id])
    article.update(read: params[:change])

  end
  
end
