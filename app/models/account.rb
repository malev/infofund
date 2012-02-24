class Account
  include Mongoid::Document

  field :ammount,        :type => Float
  field :constituted_at, :type => Date

  belongs_to :user
  belongs_to :fund

  def daily_value
  	fund.daily.value_at_date/1000 * ammount
  end
end