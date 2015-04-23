json.array!(@advertistment_packages) do |advertistment_package|
  json.extract! advertistment_package, :id, :company, :first_name, :last_name, :email, :phone, :package
  json.url advertistment_package_url(advertistment_package, format: :json)
end
