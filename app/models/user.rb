class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :rpx_connectable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :is_customer

  # http://webtempest.com/rails-3-easy-user-sign-upin-devise-with-rpx-janrain-via-rpx_connectable/
  def on_before_rpx_success(rpx_data)
      logger.info rpx_data.inspect + "-------------------------------"

       name = rpx_data["name"]

      # Facebook
      # {"identifier"=>"http://www.facebook.com/profile.php?id=620375350", 
      # "email"=>"adamloving@gmail.com", "username"=>"AdamLoving", 
      # "name"=>"Adam Loving", "verifiedEmail"=>"******@gmail.com", 
      # "url"=>"http://www.facebook.com/adamloving", "providerName"=>"Facebook", 
      # "photo"=>"http://graph.facebook.com/620375350/picture?type=large"}

      # Twitter
      # {"identifier"=>"http://twitter.com/account/profile?user_id=809641", 
      # "email"=>nil, "username"=>"adamloving", "name"=>"Adam Loving", 
      # "verifiedEmail"=>nil, "url"=>"http://twitter.com/adamloving", 
      # "providerName"=>"Twitter", "photo"=>"http://a2.twimg.com/profile_images/1338178047/image_normal.jpg"}
      
      # Google
      # {"identifier"=>"https://www.google.com/profiles/104417604089345244854", 
      # "email"=>"adamloving@gmail.com", "username"=>"adamloving", "name"=>"adamloving", 
      # "verifiedEmail"=>"******@gmail.com", "url"=>"https://www.google.com/profiles/104417604089345244854", 
      # "providerName"=>"Google", "photo"=>nil}

      unless name.nil?
        self.first_name = name["givenName"]
        self.last_name = name["familyName"]
        self.save
      end
  end

  def on_before_rpx_auto_create(rpx_user)
    logger.info "before_rpx_auto_create"
    # todo: find existing user?
  end

  def get_access_link
    Digest::MD5.base64digest(self.email)
  end

end
