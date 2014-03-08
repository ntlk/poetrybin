class PoemsController < ApplicationController

  def index
    @poems = Poem.order('created_at DESC')
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def random
    @poem = Poem.order('RANDOM()').first
    render :show
  end

end
