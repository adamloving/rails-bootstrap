class User < ActiveRecord::Base
  devise :omniauthable

  attr_accessible :email
  attr_accessible :name
  attr_accessible :provider
  attr_accessible :uid
  attr_accessible :photo_url
  attr_accessible :access_token
  
  def User.find_for_facebook_oauth(auth, signed_in_resource = nil)
    Rails.logger.info "USER INFO #{auth.info}"
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    
    if user
      Rails.logger.info "UPDATING #{auth.info.image}"
      user.name = auth.extra.raw_info.name
      user.email = auth.info.email
      user.photo_url = auth.info.image
      user.access_token = auth.credentials.token      
      user.save
    else
      user = User.create!(
        provider: auth.provider,
        uid: auth.uid,
        name: auth.extra.raw_info.name,
        email: auth.info.email,
        photo_url: auth.info.image,
        access_token: auth.credentials.token
      )
      puts "NEW USER #{user}"
    end
    user
  end

  def is_admin?
    false
  end
end
