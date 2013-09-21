puts 'Adding Roles'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end

puts 'Adding Admin'
admin = User.find_by(email: ENV['ADMIN_EMAIL'])

if admin.blank?
  admin = User.create(
    :name => ENV['ADMIN_NAME'].dup,
    :email => ENV['ADMIN_EMAIL'].dup,
    :password => ENV['ADMIN_PASSWORD'].dup,
    :password_confirmation => ENV['ADMIN_PASSWORD'].dup,
    :affiliate_id => ENV["AVANTLINK_AFFILIATE_ID"].dup,
    :auth_key => ENV["AVANTLINK_AUTH_KEY"].dup)
  puts "Finished adding admin. Confirming account."
  admin.skip_confirmation!
  puts "Adding admin to admin role."
  admin.add_role 'admin'
end

puts "Adding Websites"

#Add Default Accounts
websites = ['bikejerseysandbibs']
websites.each do |name|
  domain = "#{name.downcase}.com"
  website = Website.where(:jot => name.downcase).first
  if website.blank?
    website = Website.new
    website.name = name
    website.url = domain
    website.jot = name.downcase
    website.theme = 'default'
    website.user = admin
    website.external_id = ENV["AVANTLINK_WEBSITE_ID"].dup
    website.save!
  end
end

puts "Finished"
