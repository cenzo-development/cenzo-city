class AddressVerifier
  API_KEY = 'f1OfOs1ONyacN7DWsOTRC6wiqVun61yZ66dKKe5q'

  def self.check_address(postcode, number)
    url = URI("https://api.postcodeapi.nu/v2/addresses/?postcode=#{postcode}&number=#{number}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-api-key"] = API_KEY
    request["accept"] = 'application/hal+json'
    response = http.request(request)

    data = JSON.parse(response.read_body) if response.present?
    return data
  end

end
