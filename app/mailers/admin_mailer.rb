class AdminMailer < ActionMailer::Base
  default :from => "from@example.com"
  def purchase_notification(customer)
    recipients "<from@example.com>"
    from       "Site Notification"
    subject    "New customer"
    sent_on    Time.now
    body       :customer => customer
  end
end
