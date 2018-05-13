class RegistrationsController < Devise::RegistrationsController
  after_action :save_user_timezone, only: :create

  private

  def save_user_timezone
    return unless resource.persisted?
    resource.update(timezone: cookies[:timezone])
  end
end
