require 'nokogiri'
require 'open-uri'


def crazy_scrapper

  result_array = []
  symbol_array = []
  price_array = []

  doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  doc.xpath('//*[@class="text-left col-symbol"]').each do |symbol|
    symbol_array << symbol.content
  end

  doc.xpath('//*[@class="price"]').each do |price|
    price_array << price.content.delete('$').to_f # possible de [1..-1]
  end

  # ".zip" Converts any arguments to arrays, then merges elements of self with corresponding elements from each argument.
  symbol_array.zip(price_array).each do |join| 
    result_array << {join[0] => join[1]}
  end
  return result_array
end

puts crazy_scrapper.inspect #.inspect 

#a tester each_with_index !! pour push deux arguments ! 