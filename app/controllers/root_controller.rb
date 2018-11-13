class RootController < ApplicationController
  def index
    puts user_session
    puts user_signed_in?
    puts current_user
  end
end
