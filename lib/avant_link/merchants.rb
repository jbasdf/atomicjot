class AvantLink::Merchants

  def initialize(affiliate_id, auth_key)
    @api = AvantLink::Api.new(affiliate_id, auth_key)
  end

  # This will both create and update any merchants
  def create_update(user)
    merchant_list.each do |m|
      # Look for merchants that this affiliate account is actively associated with.
      if m['Association_Status'] == 'active'
        merchant = do_db(m)
        user.merchants << merchant unless user.merchants.include?(merchant)
      end
    end
  end

  def do_db(merchant)
    attributes = build_attributes_for_merchant(merchant)
    merchant = Merchant.find_by_merchant_id(attributes[:merchant_id])
    if merchant
      merchant.update_attributes(attributes)
      puts "Updated #{merchant.name}"
    else
      merchant = Merchant.create!(attributes)
      puts "Created #{merchant.name}"
    end
    merchant
  end

  # Get the list of merchant accounts at AvantLink, and cycle through each.
  def merchant_list
    @merchant_list ||= @api.associations
  end

  def find_merchant(merchant_id)
    merchant_list.each do |merchant|
      return merchant if merchant['Merchant_Id'] == merchant_id
    end
  end

  def build_attributes_for_merchant(merchant)
    return {} if merchant.blank?
    attributes = {}
    @accepted_columns ||= Merchant.column_names
    merchant.each do |k,v|
      if k == 'Merchant_Name'
        attributes[:name] = Merchant.build_name(v)
        attributes[:tiny_logo] = Merchant.build_logo(v)
      elsif @accepted_columns.include?(k.downcase)
        attributes[k.downcase.to_sym] = v
      end
    end
    attributes
  end

end