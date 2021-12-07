require 'open-uri'
require 'nokogiri'

class Scrapper
    BASE_URL  = "https://coinmarketcap.com"
    COINS_LIST = "#{BASE_URL}/all/views/all/"

    def fetch()
        items = Array.new

        # get url
        html = URI.open(COINS_LIST)
        doc = Nokogiri::HTML(html)

        items = parse_items(doc)

        items
    end

    private

    def parse_items(doc)
        items = Array.new

        table = doc.css('table tbody tr.cmc-table-row')

        table.each do |item|
            coin = Hash.new

            name = item.css('td.cmc-table__cell.cmc-table__cell--sticky.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--sort-by__name div a[3]').inner_html
            short = item.css('td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--hide-sm.cmc-table__cell--sort-by__symbol div').inner_html
            price = item.css('td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--right.cmc-table__cell--sort-by__price div a span').inner_html
            market_cap = item.css("td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--right.cmc-table__cell--sort-by__market-cap p span[1]").inner_html

            coin['name'] = name
            coin['short'] = short
            coin['price'] = price
            coin['market_cap'] = market_cap
            
            unless name == ""
                items.push(coin)
            end
        end

        items
    end
end