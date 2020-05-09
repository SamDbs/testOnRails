class FluxsController < ApplicationController

  def index
    fluxs = Flux.all
  end

  def new
    flux = Flux.new
  end

  def create
    flux = Flux.create(post_params)

  end

  def post_params  

    params.require(:flux).permit(:title,:url)
  end
end
