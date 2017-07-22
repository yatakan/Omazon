class OrderMailer < ApplicationMailer
  default from: "omazonprojects@gmail.com"

  def order_mail_to_user(user, order)
    @user = user
    @order = order
    mail(
      subject: "ご注文ありがとうございます！",
      to: @user.email) do |format|
      format.text
    end
  end
end
