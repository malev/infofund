class User
  include Mongoid::Document

  field :name, :type => String
  field :email, :type => String

  has_many :accounts
  has_and_belongs_to_many :funds

  def total
    output = 0.0
    accounts.each { |account| output += account.daily_value }
    output
  end
end