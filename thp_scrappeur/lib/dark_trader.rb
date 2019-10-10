require 'nokogiri'
require 'open-uri'


result_array = []
symbol_array = []
price_array = []

doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
doc.xpath('//*[@class="text-left col-symbol"]').each do |symbol|
  symbol_array << symbol.content
end

doc.xpath('//*[@class="price"]').each do |price|
  price_array << price.content.delete('$')
end


# ".zip" Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
symbol_array.zip(price_array).each do |join| 
  esult_array << {join[0] => join[1]}
end

puts result_array.inspect


