class AvantLink::Api

  include HTTParty
  base_uri 'https://www.avantlink.com/api.php'

  default_params :output => 'xml'

  def initialize(affiliate_id, auth_key)
    @auth = {
      :affiliate_id => affiliate_id,
      :auth_key => auth_key
    }
  end

  # Create a raw datafeed file subscription for a given merchant feed.
  # The options used in creating the datafeed are quite basic:
  #     -XML format
  #     -Gzip compression
  #     -No filtering (e.g. by taxonomy); all products are included
  # Consult the API documentation for the ConfigureDatafeed module
  # for other options that are available, and customize to your
  # own preferences.
  def set_data_feed(website_id, datafeed_id, file_format = 'csv')
    query = {
      :module => 'ConfigureDatafeed',
      :website_id => website_id,
      :datafeed_id => datafeed_id,
      :file_format => file_format,
      :file_compression => 'none'
    }.merge(@auth)

    self.class.get('', :query => query)
  end

  # Retrieve the list of tool configuration / subscriptions of the specified type.
  # This module allows you to retrieve a list of your datafeed subscriptions, along with certain pieces of information about the merchant feed such as the date/time of last update, the total available record count, etc.
  # http://www.avantlink.com/api.php?help=1&module=SubscriptionFeed
  def subscriptions(subscription_type)
    query = {
      :module => 'SubscriptionFeed',
      :subscription_type => CGI.escape(subscription_type)
    }.merge(@auth)
    self.do_get(query)
  end

  # Retrieve the list of merchants available from AvantLink (with Id and categorization information) along
  # with a status field indicating the association/relation of the requesting user to
  # that merchant, e.g. "active", "pending", "denied", "none".
  def associations
    query = {
      :module => 'AssociationFeed'
    }.merge(@auth)
    self.do_get(query)
  end

  # This module produces raw data feeds for the Deal of the Day tool.
  # http://www.avantlink.com/api.php?help=1&module=DotdFeed
  def dotd_feed(website_id, merchant_id = nil)
    query = {
      :module => 'DotdFeed',
      :website_id => website_id,
      :output => 'xml'
    }.merge(@auth)
    query[:merchant_id] = merchant_id if merchant_id
    self.do_get(query)
  end

  # This module retrieves all the websites for a given affiliate.
  # https://www.avantlink.com/api.php?module=WebsiteFeed&output=xml
  def websites
    query = {
      :module => 'WebsiteFeed',
      :output => 'xml'
    }.merge(@auth)
    result = self.do_get(query)
    result = [result] if result.is_a?(Hash)
    result
  end

  # This module retrieves all available advertising content for a given product in a merchant's datafeed.
  # http://www.avantlink.com/api.php?help=1&module=ProductContent
  def product_content(website_id, merchant_id, datafeed_id, sku)
    query = {
      :module => 'ProductContent',
      :website_id => website_id
    }.merge(@auth)
    query[:merchant_id] = merchant_id if merchant_id
    query[:datafeed_id] = datafeed_id if datafeed_id
    query[:sku] = sku if sku

    self.class.get('', :query => query)
  end

  # This module allows you to get a real time price check on a merchant's product.
  # It can also be used to retrieve the full pricing history for a product, to illustrate any known price changes that have occurred over time.
  # http://www.avantlink.com/api.php?help=1&module=ProductPriceCheck
  def product_prices(merchant_id, datafeed_id, sku)
    query = {
      :module => 'ProductPriceCheck',
      :show_retail_price => 1,
      :show_pricing_history => 1
    }.merge(@auth)
    query[:merchant_id] = merchant_id if merchant_id
    query[:datafeed_id] = datafeed_id if datafeed_id
    query[:sku] = sku if sku

    self.class.get('', :query => query)
  end

  # Retrieve product taxonomy (a.k.a. category/subcategory/product group)
  # information for a given merchant, for each of their available
  # product datafeeds.
  # http://www.avantlink.com/api.php?help=1&module=ProductTaxonomy
  def product_taxonomy(merchant_id)
    query = {
      :module => 'ProductTaxonomy',
      :merchant_id => merchant_id,
      :taxonomy_type => 'categories'
    }.merge(@auth)
    self.do_get(query)
  end

  def product_search(website_id, search)
    query = {
      :module => 'ProductSearch',
      :website_id => website_id,
      :search_term => search,
      :affiliate_id => @auth[:affiliate_id]
    }
    self.do_get(query)
  end

  def self.ad_search(website_id, merchant_id, ad_type = 'image')
    query = {
      :module => 'AdSearch',
      :website_id => website_id,
      :merchant_id => merchant_id,
      :ad_type => ad_type
    }.merge(@auth)
    self.do_get(query)
  end

  # runs the query making sure that data was returned.
  def do_get(query)
    if result = self.class.get('', :query => query)['NewDataSet']
      result['Table1']
    else
      []
    end
  end

end
