class CustomerMailer < ActionMailer::Base
  default :from => "from@example.com"
  def purchase_complete(user)
    recipients "#{user.first_name} #{user.last_name} <#{user.email}>"
    from       "My Site Name"
    subject    "Your account access link"
    sent_on    Time.now
    body       :user => user
  end
end
