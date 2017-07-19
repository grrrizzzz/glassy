require 'httparty'
require 'nokogiri'
require 'json'
require 'csv'

swamis = 'https://new.surfline.com/surf-report/swami-s/5842041f4e65fad6a77088b4/forecast'
swamis_html = HTTParty.get(swamis)
parsed_html = Nokogiri::HTML(swamis_html)
current_time = Time.now
surf_height =  parsed_html.css('.quiver-surf-height').text
report_time = parsed_html.css('.quiver-forecaster-profile__update-text').text
reporter = parsed_html.css('.quiver-forecaster-profile__forecaster-name').text
report_text = parsed_html.css('.sl-spot-report__text__body').text.gsub(/\s+/, ' ')
File.open('/Users/mike.grissom/surfline_data.txt', 'a') do |f|
  f << "#{current_time}\t#{report_time}\t#{reporter}\t#{surf_height}\t#{report_text}\n"
end
