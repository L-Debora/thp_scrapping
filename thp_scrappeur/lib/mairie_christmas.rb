require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)

  doc = Nokogiri::HTML(open(townhall_url))
  email = doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').first.content
    
  return email
    
end


#  Récupèrer les URLs de chaque ville du Val d'Oise.

def get_townhall_urls
  val_oise = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
  result_array = []

  doc = Nokogiri::HTML(open(val_oise))
  doc.xpath('//*[@class="lientxt"]/@href').each do |url|
    mairie_name = url.text.split("/").last.split(".").first # permet de recuperer le nom de la ville 
    mairie_url = "http://annuaire-des-mairies.com#{url.text[1..-1]}" #[1..-1] fourchette d'index pour retirer le ./

    mairie_email = get_townhall_email(mairie_url)

    result_array << {mairie_name => mairie_email}
  end

  return result_array
end 

puts get_townhall_urls.inspect
  



