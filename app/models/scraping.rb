require 'mechanize'

class Scraping

  def self.scraping_item
    puts "URLを入力してください"
    input = gets.chomp
    agent = Mechanize.new
    current_page = agent.get(input)
    name = current_page.at("#productTitle").inner_text if current_page.at("#productTitle")
    @item = Item.where(name: name).first_or_initialize

    @item.price = 5000
    @item.introduction = current_page.at("#productDescription").inner_text if current_page.at("#productDescription")
    @item.stock = 10
    @item.category_id = 17
    if @item.save
      image_url = current_page.at("#imgBlkFront").get_attribute(:src)
      @image = Image.where(image_url: image_url).first_or_initialize
      @image.item_id = @item.id
      @image.image_url = image_url
      @image.save
    end
  end

end
