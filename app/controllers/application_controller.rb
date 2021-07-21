class ApplicationController < ActionController::Base
  def correct_password
    @_password ||= Password.first.secret 
  end
end
