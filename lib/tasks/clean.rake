require 'open-uri'

module Enumerable
  def dups
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.reject{|k,v| v==1}.keys
  end
end

task :clean => :environment do
  puts "Cleaning dups..."
  Fund.each do |fund|
    str_dates = fund.quotations.collect(&:str_date)
    str_dates.dups.each do |dup|
      dup_q = fund.quotations.find_by str_date: dup
      dup_q.destroy
    end
  end
end
