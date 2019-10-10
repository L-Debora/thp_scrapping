require_relative '../lib/dark_trader'

describe "the crazy_scrapper method" do
  it "should return an array" do
    expect(crazy_scrapper).to be_a(Array)
  end
end
