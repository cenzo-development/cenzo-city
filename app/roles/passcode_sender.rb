
require 'net/https'

class PasscodeSender

  def send_passcode(mobile_number, code)
    phone_number = sanitize_cell_phone_number(mobile_number)
    uri = URI.parse("https://secure.cm.nl/smssgateway/cm/gateway.ashx?producttoken=" + ENV['sms_gateway_token'] + "&body=" + code + "&to=%2b" + phone_number + "&from=Cenzo%20City")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
  end

  private

  def sanitize_cell_phone_number(cell_phone_number)
    cell_phone_number = cell_phone_number.tr('-', '')
    cell_phone_number = cell_phone_number.tr(' ', '')

    if cell_phone_number[0] != '+'
       cell_phone_number.slice!(0)
       cell_phone_number = "31" + cell_phone_number
     end

     cell_phone_number = cell_phone_number.tr('+', '')
     return cell_phone_number
   end

end
