class OrderReceipt < ApplicationMailer
  default from: "no-reply@jungle.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_receipt.send_receipt.subject
  #
  def send_receipt(email, order)
    @order = order
    @total = @order.total_cents
    mail to: email, subject: "kdjfkdjfkd"

  end
end
