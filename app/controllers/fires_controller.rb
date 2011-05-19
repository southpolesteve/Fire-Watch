class FiresController < ApplicationController

  def index
    @fires = Fire.all
    
    # Number of Fires Per Month
    fires_per_month = Array.new
    fires_per_month = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @fires.each do |fire|
      fires_per_month[fire.alarm.month - 1] += 1
    end
    
    # Number of Fire Per Type
    fire_types = Fire.fires_by_type

    @fires_per_month = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:title][:text] = 'Fires per Month'
      f.options[:chart][:type] = "line"
      f.options[:xAxis][:labels][:rotation] = 0
      f.options[:xAxis][:labels][:align] = 'center'
      f.options[:xAxis][:plotBands] = []
      f.options[:xAxis][:categories] = ['January', 'February', 'March',
                                        'April', 'May', 'June', 'July', 'August', 
                                        'September', 'October', 'November', 'December']
      f.options[:yAxis][:title][:text] = 'Number of Fires'
      f.options[:legend][:enabled] = false
      f.series(:name => 'Fires',  :data => fires_per_month )
    end
    
    @fires_by_type = LazyHighCharts::HighChart.new('graph') do |f|
      f.options[:title][:text] = 'Top 10 Fire Types'
      f.options[:chart][:type] = "column"
      f.options[:xAxis][:labels][:rotation] = 0
      f.options[:xAxis][:labels][:align] = 'center'
      f.options[:xAxis][:plotBands] = []
      f.options[:xAxis][:categories] = fire_types.keys
      f.options[:yAxis][:title][:text] = 'Number of Fires'
      f.options[:legend][:enabled] = false
      f.series(:name => 'Fires',  :data => fire_types.to_a )
    end
  end
end