class YandexNewsService
  URL = 'https://news.yandex.ru/ru/index5.utf8.js'.freeze

  def initialize
    @result = {}
  end

  def perform
    send_request
    parse_response
    generate_result
    @result
  end

  private

  def send_request
    uri = URI(URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.read_timeout = 5
    http.open_timeout = 5
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri)
    res = http.request(request)
    @response_body = res.body
  end

  def parse_response
    @response = JSON.parse(@response_body.force_encoding('UTF-8').match('\[.*\]').to_s).first
  end

  def generate_result
    @result[:title] = @response['title']
    @result[:description] = @response['descr']
    @result[:created_at] = DateTime.strptime(@response["ts"], '%s').in_time_zone('Moscow')
  end
end