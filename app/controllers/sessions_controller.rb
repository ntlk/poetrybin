class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:password] == ADMIN_PASSWORD
      session[:admin] = true
    end
    redirect_to poems_path
  end

  def destroy
    session.destroy
    redirect_to poems_path
  end

end
