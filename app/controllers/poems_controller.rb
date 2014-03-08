class PoemsController < ApplicationController

  def show
    @poem = Poem.find(params[:id])
  end

  def random
    @poem = Poem.first(order: 'RANDOM()')
    render :show
  end

end
