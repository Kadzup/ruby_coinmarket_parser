require 'csv'
require_relative 'Scrapper'
require_relative 'CoinParser'

def export_to_csv(filename, items)
    CSV.open(filename, "wb") do |csv|
        csv << items.first.instance_variables.map {|var_name| var_name[1..-1]}
        items.each do |item|
            csv << item.values
        end
    end
end

scrapper = Scrapper.new
items = scrapper.fetch()
coins = CoinParser.parse_all(items)
export_to_csv('new_coins.csv', coins)