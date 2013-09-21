class Api::ProductsController < ApplicationController

  respond_to :json

  def index
    if params[:query]
      user = current_user || User.first
      api = AvantLink::Api.new(user.affiliate_id, user.auth_key)
      results = api.product_search(current_website.external_id, params[:query])
      products = []
      results.each do |result|
        products << result_to_product(result)
      end
    else
      products = Product.by_newest
    end
    respond_with(:api, products)
  end

  def show
    @product = Product.find(params[:id])
    respond_with(:api, @product)
  end

  def create
  end

  def destroy
  end

  protected

    # Turn a search result into a product
    def result_to_product(result)
      {
        id:                      result["Product_Id"],
        merchant_id:             result["Merchant_Id"],
        merchant_name:           result["Merchant_Name"],
        data_feed_id:            result["Datafeed_Id"],
        external_id:             result["Product_Id"],
        subcategory:             result["Subcategory_Name"],
        category:                result["Category_Name"],
        group:                   result["Department_Name"],
        sku:                     result["Product_SKU"],
        name:                    result["Product_Name"],
        brand_name:              result["Brand_Name"],
        retail_price:            result["Retail_Price"],
        sale_price:              result["Sale_Price"],
        price:                   result["Sale_Price"],
        summary:                 result["Abbreviated_Description"] || result["Short_Description"],
        description:             result["Description"],
        thumb_url:               result["Thumbnail_Image"],
        image_url:               result["Large_Image"] || result["Medium_Image"],
        buy_link:                result["Buy_URL"],
        commission:              result["Commission"]
      }
    end
end
