class SessionsController < ApplicationController

  def login
  end

  def check_password
    if params[:password] == ENV['PASSWORD']
      session[:admin] = true
    end
    redirect_to poems_path
  end

  def logout
    session.destroy
    redirect_to poems_path
  end

end
