class UsersController < ApplicationController
  def create
    # todo: obviously we need to verify their email
    u = User.find_or_create_by_email(params[:email])
    u.password = 'temporary'
    u.save
    Rails.logger.info "saved"
    render :json => { :status => 'success' }
  end
end