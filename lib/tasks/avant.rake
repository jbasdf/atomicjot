require 'rubygems'
require 'bundler'

namespace :avantlink do

  desc 'Update merchants and subscriptions from AvantLink'
  task :sync => :environment do |t|
    AvantLink.sync
  end

end
