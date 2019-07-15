class SchoolSystem
  def erb(filename, local = {})
    b = binding
    message = local[:message]
    content = File.read("app/views/#{filename}.html.erb")
    ERB.new(content).result(b)
  end

  def response(status, headers, body = '')
    status = status ? status : '200'
    headers = headers ? headers : {"Content-Type" => 'text/html'}
    body = yield if block_given?
    [status, headers, [body]]
  end
end