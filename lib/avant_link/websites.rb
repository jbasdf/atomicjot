class AvantLink::Websites

  def initialize(affiliate_id, auth_key)
    @api = AvantLink::Api.new(affiliate_id, auth_key)
  end

  # This will both create and update any websites
  def create_update(user)
    website_list.each do |m|
      website = do_db(m)
      user.websites << website unless user.websites.include?(website)
    end
  end

  def do_db(website)
    attributes = build_attributes_for_website(website)
    website = Website.find_by_external_id(attributes[:external_id])
    if website
      website.update_attributes(attributes)
      puts "Updated #{website.name}"
    else
      website = Website.create!(attributes)
      puts "Created #{website.name}"
    end
    website
  end

  # Get the list of website accounts at AvantLink, and cycle through each.
  def website_list
    @website_list ||= @api.websites
  end

  def find_website(external_id)
    website_list.each do |website|
      return website if website['Website_Id'] == external_id
    end
  end

  def build_attributes_for_website(website)
    return {} if website.blank?
    attributes = {}
    @accepted_columns ||= Website.column_names
    website.each do |k,v|
      key = k.gsub('Website_Id', 'external_id')
      key.gsub!('Website_Is_', '')
      key.gsub!('Website_', '')
      attributes[key.downcase.to_sym] = v
    end
    attributes
  end

end