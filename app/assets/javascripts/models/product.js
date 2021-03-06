AtomicJot.Product = DS.Model.extend({
  external_id:      DS.attr('string'),
  sku:              DS.attr('string'),
  merchant_name:    DS.attr('string'),
  brand_name:       DS.attr('string'),
  name:             DS.attr('string'),
  description:      DS.attr('string'),
  summary:          DS.attr('string'),
  category:         DS.attr('string'),
  subcategory:      DS.attr('string'),
  group:            DS.attr('string'),
  thumb_url:        DS.attr('string'),
  image_url:        DS.attr('string'),
  buy_link:         DS.attr('string'),
  keywords:         DS.attr('string'),
  retail_price:     DS.attr('number'),
  sale_price:       DS.attr('number'),
  price:            DS.attr('number'),
  percent_discount: DS.attr('number'),
  brand_page_link:  DS.attr('string'),
  brand_logo_image: DS.attr('string'),
  created_at:       DS.attr('date')
});