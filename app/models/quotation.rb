class Quotation
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :fund

  field :quoted_at,        :type => Date
  field :str_date,         :type => String
  field :value_at_date,    :type => Float
  field :daily_variation,  :type => Float
  field :last_thirty_days, :type => Float
  field :last_ninety_days, :type => Float
  field :anual_variation,  :type => Float
end