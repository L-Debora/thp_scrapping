require_relative '../lib/mairie_christmas'

describe "the get_townhall_email method" do
  it "should return mairie de la Teste email" do
    demo_url = "http://annuaire-des-mairies.com/33/la-teste-de-buch.html"
    expect(get_townhall_email(demo_url)).to eq('mairie@latestedebuch.fr')
  end
end