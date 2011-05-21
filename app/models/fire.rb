class Fire < ActiveRecord::Base
  include Pacecar
  acts_as_gmappable

  def gmaps4rails_address
    location
  end

  def gmaps4rails_marker_picture
    {
      "picture" => "/images/marker.png",
      "width" => "25",
      "height" => "32"
    }
  end

  def number_of_fires_since(time)
    Fire.alarm_at_after(time).count
  end

  def number_of_fires_before(time)
    Fire.alarm_at_before(time).count
  end

  def number_of_fires_between(start,finish)
    Fire.alarm_at_inside(start,finish).count
  end

  def total_call_time
    ((controlled_at - alarm_at)/60)
  end

  def supression_time
    ((controlled_at - arrival_at)/60)
  end

  def response_time
    ((arrival_at - alarm_at)/60)
  end

  def self.get_page(number)
    browser = Mechanize.new
    page = browser.get('http://www.cityofmadison.com/fire/reports/report.cfm?r=' + number.to_s)
    parsed_page = Nokogiri::HTML(page.body)
  end

  def self.parse_date(string)
    Time.strptime(string,'%m/%d/%Y %I:%M %p')
  end

end

