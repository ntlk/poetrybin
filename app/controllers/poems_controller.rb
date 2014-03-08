class PoemsController < ApplicationController

  def show
    @poem = Poem.find(params[:id])
  end

  def random
    @poem = Poem.order('RANDOM()').first
    render :show
  end

end
