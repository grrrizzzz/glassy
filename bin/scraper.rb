require 'httparty'
require 'nokogiri'
require 'json'
require 'csv'
require 'active_support/time'

OUTPUT_FILE = '/home/pi/swamis.tsv'

swamis = 'https://new.surfline.com/surf-report/swami-s/5842041f4e65fad6a77088b4/forecast'
swamis_html = HTTParty.get(swamis)
parsed_html = Nokogiri::HTML(swamis_html)

report_time_text = parsed_html.css('.quiver-forecaster-profile__update-text').text
report_time = nil

if report_time_text.match /hour/
  hours = report_time_text.gsub(/[^0-9]/, '').to_i
  report_time = Time.now - hours.hours
else
  raise ParseError
end

quality = parsed_html.css('.sl-spot-rail-header__conditions').text
surf_height =  parsed_html.css('.quiver-surf-height').text
reporter = parsed_html.css('.quiver-forecaster-profile__forecaster-name').text
report_text = parsed_html.css('.sl-spot-report__text__body').text.gsub(/\s+/, ' ')

File.open(OUTPUT_FILE, 'a') do |f|
  f << "#{report_time}\t#{reporter}\t#{quality}\t#{surf_height}\t#{report_text}\n"
end
