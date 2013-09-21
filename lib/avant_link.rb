module AvantLink

  def self.sync
    m = AvantLink::Merchants.new
    m.create_update

    avs = AvantLink::Subscriptions.new
    avs.create
    avs.update

    AvantLink::Coupons.run
  end

end