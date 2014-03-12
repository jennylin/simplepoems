require 'omniauth-twitter'
require 'lingua'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
  end

  def login
    session[:username] = "RoboJenny"
    redirect_to "/"
    #redirect to("/auth/twitter")
  end

  def logout
    session[:username] = nil
    redirect_to("/")
  end

  def auth_callback
    if env['omniauth.auth']
      session[:username] = env['omniauth.auth']['info']['name']
    else
      halt(401,'Not Authorized')
    end
    redirect_to("/")
  end

  def post
    poem = params['poem']
    p = Poem.new
    p.username = session[:username]
    p.text = poem
    p.save!
    render json: {:poem => poem}
  end
end
