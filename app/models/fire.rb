class Fire < ActiveRecord::Base

  def total_call_time
    ((controlled - alarm)/60)
  end

  def supression_time
    ((controlled - arrival)/60)
  end

  def response_time
    ((arrival - alarm)/60)
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

