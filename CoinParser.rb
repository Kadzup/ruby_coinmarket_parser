require_relative 'Coin'

class CoinParser
    def self.parse_all(items)
        items.map { |item| self.parse(item) }.compact
    end

    def self.parse(item)
        name = item['name']
        short = item['short']
        price = item['price']
        market_cap = item['market_cap']

        Coin.new(name, short, price, market_cap)
    rescue
        nil
    end
end