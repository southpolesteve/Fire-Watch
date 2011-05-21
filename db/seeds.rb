# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Fire.destroy_all

(1..590).each do |number|

  fire_page = Fire.get_page(number)

  if fire_page.xpath('//table/caption').inner_html.empty?

    @fire = Fire.new
    @fire.fire_type = fire_page.xpath('//th[@id="title"]/h2').inner_html
    @fire.alarm_at = Fire.parse_date(fire_page.xpath('//td[@headers="alarmdatetime"]').inner_html)
    @fire.arrival_at = Fire.parse_date(fire_page.xpath('//td[@headers="arrivaldatetime"]').inner_html)
    @fire.controlled_at = Fire.parse_date(fire_page.xpath('//td[@headers="controlleddatetime"]').inner_html)
    @fire.location = fire_page.xpath('//td[@headers="location"]').inner_html + ", Madison, WI"
    @fire.station = fire_page.xpath('//td[@headers="stations"]').inner_html
    @fire.unit = fire_page.xpath('//td[@headers="units"]').inner_html
    @fire.url = 'http://www.cityofmadison.com/fire/reports/report.cfm?r=' + number.to_s

    if (@fire.response_time)>=0 && (@fire.supression_time)>=0
      if @fire.save
        puts "Saved fire number " + number.to_s
      else
        puts "Fire " + number.to_s + " could not be saved"
      end
    else
      puts "Fire " + number.to_s + " had times that were not chronological"
    end
  else
    puts "Fire Report " + number.to_s + " does not exist"
  end
end

