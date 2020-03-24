class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    logger.debug "Sendgrid #{Rails.application.credentials.sendgrid[:api_key]}"
  end
end
