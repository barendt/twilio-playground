class TwilioController < ApplicationController
  def index
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello.'
    end

    render text: response.text
  end
end