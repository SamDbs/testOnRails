class ArticlesController < ApplicationController
  def index

    @articles = Article.all
    
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

    articlesJson = Article.all.to_json

    logger.debug articlesJson.inspect
  end
  
  
end
