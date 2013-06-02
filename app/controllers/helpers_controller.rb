class HelpersController < ApplicationController
  def index
    @users = User.all
  end

  def twitch
    @user = User.find(params[:id])
    @twitch_data = @user.twitch_data
  end
end
