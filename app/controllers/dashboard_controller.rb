class DashboardController < ApplicationController
  def show
    # @twitch_data = TwitchData.new("datmodz")
    @twitch_data = TwitchData.new("runit_3")
  end
end
