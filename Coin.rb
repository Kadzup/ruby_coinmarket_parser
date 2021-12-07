class Coin
    attr_accessor :name, :short, :price, :market_cap

    def initialize(name, short, price, market_cap)
        @name = name
        @short = short
        @price = price
        @market_cap = market_cap
    end

    def values
        [@name, @short, @price, @market_cap]
    end
end