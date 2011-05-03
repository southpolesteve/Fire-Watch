class Fire < ActiveRecord::Base

public

  def self.get_page(number)
    browser = Mechanize.new
    page = browser.get('http://www.cityofmadison.com/fire/reports/report.cfm?r=' + number.to_s)
    parsed_page = Nokogiri::HTML(page.body)
  end

  def self.parse_date(string)
    Time.strptime(string,'%m/%d/%Y %I:%M %p')
  end

end

