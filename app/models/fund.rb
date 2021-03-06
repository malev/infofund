class Fund
  include Mongoid::Document

  embeds_many :quotations
  has_and_belongs_to_many :users

  field :name,    type: String
  field :starred, type: Boolean

  scope :starred, where(starred: true)

  def self.process(tr, str_date)
    values = []
    fund_name = tr.css("td").first.text.strip
    tr.css("td")[-5..-1].each { |td| values << parse_value(td.text) }

    fund = self.where(:name => fund_name).first
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

  def self.loaded_at?(str_date)
    Fund.where("quotations.str_date" => str_date).first
  end

  def daily
    quotations.last
  end

  def daily_variation
    self.quotations.map { |q| q.daily_variation }
  end

  def value_at_date
    self.quotations.map { |q| q.value_at_date }
  end

  def dates
    self.quotations.map { |q| q.str_date }
  end

end
