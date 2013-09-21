class Merchant < ActiveRecord::Base

  has_many :associations, :inverse_of => :merchant
  has_many :users, :through => :associations

  scope :only_featured, where("merchants.featured = ?", true)
  scope :by_name, order("merchants.name ASC")
  scope :by_newest, order("merchants.created_at DESC")
  scope :by_oldest, order("merchants.created_at ASC")
  scope :by_latest, order("merchants.updated_at DESC")
  scope :newer_than, lambda { |*args| where("merchants.created_at > ?", args.first || DateTime.now) }
  scope :older_than, lambda { |*args| where("merchants.created_at < ?", args.first || 12.hours.ago.to_s(:db)) }

  extend FriendlyId
  friendly_id :name, :use => :slugged

  before_save :set_match_url

  def self.build_name(name)
    name.gsub('.com', '').titleize
  end

  def self.build_logo(name)
    name.gsub('.com', '').gsub(" ", "_").gsub("'", "").downcase + ".png"
  end

  def self.matchable_url(url)
    m_url = url.host.split('.').last(2).join('.').downcase
    if m_url == 'co.uk'
      m_url = url.host.split('.').last(3).join('.').downcase
    end
    m_url
  end

  def set_match_url
    url = self.merchant_url
    url = "http://#{url}" unless url[0...4] == 'http'
    self.match_url = Merchant.matchable_url(URI.parse(url))
  end

end
