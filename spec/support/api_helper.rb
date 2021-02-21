module ApiHelper
  def authenticated_header(request, api_key)
    request.headers.merge!('Authorization': "Token #{api_key}")
  end

  def json_parse(json)
    JSON.parse(json)
  end
end