def postgres_url_deconstruct(s)
  # Handle postgres:// urls, because "pg" doesn't see fit to expose
  # modern libpq functionality of the same.
  require 'uri'
  u = URI.parse(s)
  if u.scheme != 'postgres'
    raise "Cannot parse URI a postgres one: #{s.inspect}"
  end

  user, password = if u.userinfo.nil?
    [nil, nil]
  else
    parts = u.userinfo.split(':')
    case parts.length
    when 1
      [parts.first, nil]
    when 2
      parts
    else
      raise 'BUG'
    end
  end

  {
    host: u.host,
    dbname: u.path[1..-1],
    port: u.port,
    user: user,
    password: password
  }.select do |k, v|
  # Avoid including nil entries so libpq defaults (like environment
  # variables) can be used.
    !v.nil?
  end
end
