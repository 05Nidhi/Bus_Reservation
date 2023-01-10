class LogoutsController < ApplicationController
  def new
    @current_user.flag = false
    @current_user.save
    redirect_to logins_new_path
  end
end
