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

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(params.require(:poem).permit(:title, :body))
    redirect_to poem_path(@poem)
  end
end
