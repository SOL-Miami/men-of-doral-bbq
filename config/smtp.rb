SMTP_SETTINGS = {
  address: ENV.fetch("SMTP_ADDRESS"),
  authentication: :plain,
  domain: ENV.fetch("SMTP_DOMAIN"),
  enable_starttls_auto: true,
  password: ENV.fetch("MANDRILL_APIKEY"),
  port: "587",
  user_name: ENV.fetch("MANDRILL_USERNAME")
}
