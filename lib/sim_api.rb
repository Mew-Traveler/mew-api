# frozen_string_literal: true
require 'http'
# define the similiar function here
module Load
  def http_get(url, key, value)
    HTTP.get("#{url}.to_s",
             params: { "#{key}": value })
  end
end
