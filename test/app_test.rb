ENV['RACK_ENV'] = 'test'

require 'sinatra/base'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'
require 'nokogiri'

require_relative '../lib/app'

describe IdeaBoxApp do
  include Rack::Test::Methods

  def app
    IdeaBoxApp.new
  end

  it "has content that renders" do
    get '/'
    assert last_response.ok?
  end

end
