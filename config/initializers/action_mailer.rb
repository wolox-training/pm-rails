Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: Rails.application.secrets.mailer_user_name,
    password: Rails.application.secrets.mailer_password,
    address: Rails.application.secrets.mailer_address,
    domain: Rails.application.secrets.mailer_domain,
    port: Rails.application.secrets.mailer_port,
    authentication: :cram_md5
  }
end
