class FiresController < ApplicationController

  def index
    @fires_all = Fire.all
    @fires_week = Fire.alarm_at_after(1.week.ago)
    @fires_month = Fire.alarm_at_after(1.month.ago)
  end

end

