class PoemsController < ApplicationController

  def index
    @poems = Poem.visible.order('created_at DESC')
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def random
    @poem = Poem.visible.random.first
    render :show
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.create(params.require(:poem).permit(:title, :body))
    redirect_to poem_path(@poem)
  end

  def hide
    if logged_in?
      @poem = Poem.find(params[:id])
      @poem.update_attribute(:hidden, true)
    end
    redirect_to poems_path
  end
end
