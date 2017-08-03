module ItemsHelper
  def how_many_stock
    if @item.stock >= 1
      content_tag :p, "#{@item.stock} 点の在庫あり", class:"cart-stock"
    else
      content_tag :p, "ただいま入荷待ちです。ご注文頂けません。", class:"cart-stock-red"
    end
  end
end
