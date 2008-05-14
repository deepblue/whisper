$:.unshift File.dirname(__FILE__)

require 'rubygems'
require 'oauth'
require 'oauth/consumer'
require 'activesupport'
require 'cgi'

class Whisper
  def initialize(opts)
    %w(consumer_token consumer_secret access_token access_secret).each do |k|
      raise "parameter '#{k}' missed." unless opts.has_key?(k.to_sym)
    end
    
    @consumer = OAuth::Consumer.new opts[:consumer_token], opts[:consumer_secret], :site => 'http://whisper.playmaru.net'
    @access_token = OAuth::AccessToken.new @consumer, opts[:access_token], opts[:access_secret]
  end
  
  def get_messages(box = nil, params = {})
    url = '/messages'
    url += "/#{box}" if box
    url += "?#{parameters_for_get(params)}" if params.length > 0
    p url
    
    Message.parse_collection @access_token.get(url).body
  end
  
  def post_message(to, content)
    body = "openid_to=#{CGI.escape(to)}&content=#{CGI.escape(content)}"
    @access_token.post('/messages', body).code.to_s == '200'
  end
  
protected
  def parameters_for_get(params)
    params.map do |k, v|
      v = 'yes' if v == true
      v = 'no'  if v == false
      "#{k}=#{CGI.escape(v.to_s)}"
    end.join('&')
  end
end

require 'whisper/account'
require 'whisper/message'
