class FluxsController < ApplicationController
  skip_forgery_protection

  def read
    logger = Rails.logger
    fluxs = Flux.all
    fluxsJson = fluxs.to_json
    logger.debug fluxsJson.inspect
    render :json => fluxsJson
    # GET

  end

  def create
    flux = Flux.create(post_params)
    # POST
  end

  def post_params  
    params.require(:flux).permit(:title,:url)
  end
end
