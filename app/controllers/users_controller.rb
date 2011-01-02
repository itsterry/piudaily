class UsersController < ApplicationController

  def create
    @user=User.new(params[:user])
    if @user.save
      flash[:notice]='You are now subscribed'
      render :template=>'users/thankyou'
    else
      flash[:alert]='check for errors'
      render :action=>'new'
    end
  end

  def index
    redirect_to new_user_path
  end

  def new
    @user=User.new
  end




end
