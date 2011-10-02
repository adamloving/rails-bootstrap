class Api::PaypalController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  # configure your paypal button with
  # notify_url=http://mysite/paypal
  # 
  # todo: export to mailchimp "customer" list

  # Other fields available from PayPal (some may only apply to subscriptions)
  #
  # last_name: Loving
  # receiver_email: you@yoursite.com
  # residence_country: US
  # mc_amount1: 0.00
  # payer_status: verified
  # txn_type: subscr_cancel
  # recur_times: 10
  # payer_business_name: yoursite.com
  # first_name: Adam
  # btn_id: 3268824
  # item_name: Your Cool Product
  # charset: windows-1252
  # notify_version: 2.6
  # recurring: 1
  # business: you@yoursite.com
  # payer_id: ALPHANUMERIC
  # period3: 1 M
  # period1: 1 M
  # verify_sign: Ad3yuZ1231CyOtGf8kJ9JsKqcWg7A6xXxxXRiUg.TCGD2XqxxxOMcgIa
  # subscr_id: S-ALPHANUMERIC
  # amount3: 1.99
  # amount1: 0.00
  # mc_amount3: 1.99
  # mc_currency: USD
  # subscr_date: 10:05:58 Feb 15, 2009 PST
  # payer_email: customer@gmail.com
  # reattempt: 1
  #
  # Test with...
  # test: curl -d "txn_type=payment&payer_email=test@email.com&first_name=testfirst&last_name=testlast" http://localhost:3000/api/paypal
  def create
    payer_email = params[:payer_email]
    txn_type = params[:txn_type] # subscr_failed, subscr_cancel, subscr_payment, subscr_signup, subscr_eot, subscr_modify
    
    if params[:reason_code] == 'refund'
      # TODO: just notify me that somebody refunded, keep their is_customer flag set to true
    else
      # add/flag customer
      u = User.find_or_create_by_email(payer_email)
      u.first_name = params[:first_name] # overwrite whatever we've got with Paypal's info
      u.last_name = params[:last_name]
      u.password = 'temporary'
      u.is_customer = true
      u.save
      CustomerMailer.deliver_purchase_complete(u) # send them a link
      AdminMailer.deliver_purchase_notification(u) # let me know they were added
      subject = 'Customer added'
    end
    
    render :text => 'OK'
  end
  

end