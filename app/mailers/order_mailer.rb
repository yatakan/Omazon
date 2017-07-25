class OrderMailer < ApplicationMailer
  default from: "omazonprojects@gmail.com"

  def order_mail_to_user(user, order, shoppings, sum)
    initial_valiable(user, order, shoppings, sum)
    mail(
      subject: "ご注文ありがとうございます！",
      to: @user.email) do |format|
      format.html
    end
  end

  def order_mail_to_owner(user, order, shoppings, sum)
    initial_valiable(user, order, shoppings, sum)
    mail(
      subject: "注文がありました！",
      to: "omazonprojects@gmail.com") do |format|
      format.html
    end
  end

  def initial_valiable(user, order, shoppings, sum)
    @user = user
    @order = order
    @shoppings = shoppings
    @sum = sum
  end
end
