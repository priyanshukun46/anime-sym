class SessionsController < ApplicationController
  def new
    redirect_to root_path, notice: "You are already signed in." if logged_in?
  end

  def create
    email = params[:email].to_s.strip
    if email.present? && params[:password].present?
      session[:user_email] = email
      redirect_to root_path, notice: "Welcome back to Anime Sym!"
    else
      flash.now[:alert] = "Please provide both email and password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:user_email)
    redirect_to root_path, notice: "Signed out successfully."
  end
end
