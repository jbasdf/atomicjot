#!/usr/bin/env ruby
class Slurper < SlurpBase

  def self.run(type = 'modified', from = 1.day.ago)
    DataFeed.ready_to_harvest(1.second.ago).includes(:merchant).each do |data_feed|
      data_feed.harvest(type, from)
    end
  rescue => ex
    self.handle_error("http://#{ENV["APPLICATION_URL"]}/data_feed_harvest_died")
  end

  def self.clean(from = 1.day.ago)
    DataFeed.all.each do |data_feed|
      data_feed.clean(from)
    end
  rescue => ex
    self.handle_error("http://#{ENV["APPLICATION_URL"]}/clean_died")
  end

end