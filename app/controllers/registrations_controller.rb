class RegistrationsController < ApplicationController
  def new
    redirect_to root_path, notice: "You already have an active session." if logged_in?
  end

  def create
    email = params[:email].to_s.strip
    username = params[:username].to_s.strip
    password = params[:password].to_s

    if email.present? && username.present? && password.length >= 6
      session[:user_email] = email
      session[:username] = username
      redirect_to root_path, notice: "Account created! Welcome to Anime Sym, #{username}."
    else
      flash.now[:alert] = "Please enter a valid username, email, and password (min 6 characters)."
      render :new, status: :unprocessable_entity
    end
  end
end
