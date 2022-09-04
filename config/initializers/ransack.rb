Ransack.configure do |config|
  config.add_predicate :during_month,
                        :arel_predicate => :between,
                        :formatter => proc { |v|
                          # 12月度以外の処理
                          unless v.month == 12 
                            endday = Time.zone.parse("#{v.year}-#{v.month + 1}-1").to_date - 1
                          # 12月度の処理
                          else 
                            endday = Time.zone.parse("#{v.year + 1}-1-1").to_date - 1
                          end
                          Time.zone.parse("#{v.year}-#{v.month}-1").to_date..endday
                        },
                        :type => :date
end