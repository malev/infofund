require 'mongoid'
require 'nokogiri'
require 'open-uri'
require 'sinatra'

Sinatra::Base.environment = "development"

# j874JF9js2h
# mongo ds031277.mongolab.com:31277/fund_information -u <user> -p <password>
# To connect using a driver via the standard URI (what's this?):
# mongodb://malev:j874JF9js2h@ds031277.mongolab.com:31277/fund_information 

Mongoid.load!("config/mongoid.yml")

class Fund
  include Mongoid::Document
  
  embeds_many :quotations
  
  field :name, type: String

  def self.process(tr, str_date)
    values = []
    fund_name = tr.css("td").first.text.strip
    tr.css("td")[-5..-1].each { |td| values << parse_value(td.text) }

    fund = self.where(name: fund_name).first
    fund ||= self.create(:name => fund_name)

    quotation = fund.quotations.build
    quotation.value_at_date    = values[0]
    quotation.daily_variation  = values[1]
    quotation.last_thirty_days = values[2]
    quotation.last_ninety_days = values[3]
    quotation.anual_variation  = values[4]
    quotation.str_date         = str_date
    quotation.quoted_at        = Time.parse(str_date)
    quotation.save
  end

  def self.parse_value(text)
    re = /\((.+)\)/
    pre_text = if text =~ re
      # Negative
      "-" + re.match(text).captures.first
    else
      # Positive
      text
    end
    pre_text.gsub(/[\.\,]/, ',' => '.', '.' => '').to_f
  end
end

class Quotation
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :fund

  field :quoted_at,       type: Date
  field :str_date,         type: String
  field :value_at_date,    type: Float
  field :daily_variation,  type: Float
  field :last_thirty_days, type: Float
  field :last_ninety_days, type: Float
  field :anual_variation,  type: Float
end

url = "http://www.santanderrio.com.ar/individuos/inversiones_fondos_rendimiento.jsp"
doc = Nokogiri::HTML(open(url))

puts doc.at_css("title").text

quotation_date = Object.new

doc.css("#contenidosSeccion .notaText table tr").each do |tr|
  quotation_date = tr if tr.text =~ /Rendimientos/
end

str_date = /\d{2}\/\d{2}\/\d{4}/.match(quotation_date.text).to_s

doc.css("#contenidosSeccion .notaText table tr").each do |tr|
  if tr.at_css("td") and tr.at_css("td table")
    Fund.process(tr, str_date)
  end
end

cad = "1.734,47   "
cad.gsub(/[\.\,]/, ',' => '.', '.' => '')
