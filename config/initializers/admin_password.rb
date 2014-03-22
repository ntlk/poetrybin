if ENV['PASSWORD'].present?
  ADMIN_PASSWORD = ENV['PASSWORD']
elsif Rails.env.test?
  ADMIN_PASSWORD = 'password'
else
  raise('Please specify the Poetrybin admin password by setting the PASSWORD environment variable')
end
