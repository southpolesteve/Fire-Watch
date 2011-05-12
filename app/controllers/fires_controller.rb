class FiresController < ApplicationController

  def index
    @fires = Fire.all
    @chart = Gchart.line(:data => [0, 40, 10, 70, 20])
  end
  
end