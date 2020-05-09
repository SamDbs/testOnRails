class ArticlesController < ApplicationController
  def index

    @articles = Article.all
    
  end
  def news
    fluxs = Flux.all
    require 'rss'
    require 'open-uri'
    # logger = Rails.logger
    # logger.debug fluxs.inspect
    fluxs.each do |flux|
      rss = RSS::Parser.parse(open("#{flux.url}").read, false).items[0..5]
      
      rss.each do |result|
        logger = Rails.logger
        logger.debug result.inspect
        Article.create! :title => result.title, :summary => result.description,:date => result.date, :url => result.link, :flux_id => flux.id
      end
    end
  end
  
  
end
