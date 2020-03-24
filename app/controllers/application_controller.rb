class ApplicationController < ActionController::Base
    # Ensure User is logged in
    before_action :authenticate_user!
end
