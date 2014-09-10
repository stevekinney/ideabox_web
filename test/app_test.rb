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

  it "has a header" do
    get '/'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "IdeaBox", html.css('h1').text
  end

end
