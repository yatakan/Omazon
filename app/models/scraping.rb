require 'mechanize'

class Scraping

  def self.scraping_items_urls
    page_links = []
    agent = Mechanize.new
    current_page = agent.get("https://www.amazon.co.jp/s/ref=nb_sb_noss_2?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&url=search-alias%3Dstripbooks&field-keywords=%E8%8B%B1%E7%B1%B3%E6%96%87%E5%AD%A6")
    elements = current_page.search(".s-result-item a")

    elements.each do |ele|
      page_links << ele[:href]
    end

    page_links.each do |link|
      scraping_items(link)
    end
  end

  def self.scraping_items(link)
    agent = Mechanize.new
    current_page = agent.get(link)
      if current_page.at('#productTitle')
        name = current_page.at('#productTitle').inner_text
        @item = Item.where(name: name).first_or_initialize
        puts name
        # @item.image = current_page.at('#img-wrapper img').get_attribute(:src)
        # @item.price = current_page.at('#buyNewSection').inner_text
        # @item.introduction = current_page.at('#productDescription p:first-child')
        # @item.save
      end
  end
  # def self.scraping_items_urls
  #   category_links = []
  #   agent = Mechanize.new
  #   current_page = agent.get("https://www.amazon.co.jp/s/ref=lp_466284_nr_n_0?fst=as%3Aoff&rh=n%3A465392%2Cn%3A%21465610%2Cn%3A466284%2Cn%3A548206&bbn=466284&ie=UTF8&qid=1500783171&rnid=466284")
  #   elements = current_page.search('.categoryRefinementsSection li a')

  #   elements.each do |ele|
  #     category_links << ele[:href]
  #   end

  #   category_names = current_page.search('.refinementLink')

  #   category_names.each do |cate|
  #     name = cate.inner_text
  #     category = Category.where(name: name).first_or_initialize
  #     category.save
  #   end

  #   category_links.each do |link|
  #     scraping_item_page_links(link)
  #   end
  # end

  # def self.scraping_item_page_links(link)
  #   puts link
  #   agent = Mechanize.new
  #   current_page = agent.get(link)
  #   elements = current_page.search('.s-item-container a')

  #   elements.each do |ele|
  #     scraping_item(link)
  #   end
  # end

  # def self.scraping_test
  #   agent = Mechanize.new
  #   current_page = agent.get("https://www.amazon.co.jp/%E5%90%9B%E3%81%AE%E8%86%B5%E8%87%93%E3%82%92%E3%81%9F%E3%81%B9%E3%81%9F%E3%81%84-%E5%8F%8C%E8%91%89%E6%96%87%E5%BA%AB-%E4%BD%8F%E9%87%8E%E3%82%88%E3%82%8B-ebook/dp/B071RFTDZG/ref=lp_467248_1_2?s=books&ie=UTF8&qid=1500807530&sr=1-2")
  #   elements = current_page.at('#ebooksProductTitle').inner_text
  #   puts elements
  # end
end
