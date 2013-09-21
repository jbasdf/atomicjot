class SlurpBase

  def self.handle_error(url)
    puts "******************************************************************************************"
    puts "Error: #{$!}"
    puts "Stack Trace: #{$@}"
    Toadhopper(ENV["HOPTOAD_KEY"]).post!($!, {:url => url})
  end

  def self.price_entry(price, now)
    {
      :price => price.to_f,
      :created_at => now
    }
  end

end