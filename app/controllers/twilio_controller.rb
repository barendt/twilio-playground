class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hello.'
      r.Gather numDigits: '1', action: selection_path do |g|
        g.Say 'Please enter a number'
      end
    end

    render plain: response.text
  end

  def selection
    twiml_say "You entered the number #{params[:Digits]}", true
  end

  private

  def twiml_say(phrase, exit = false)
      # Respond with some TwiML and say something.
      # Should we hangup or go back to the main menu?
      response = Twilio::TwiML::Response.new do |r|
        r.Say phrase, voice: 'alice', language: 'en-GB'
        if exit 
          r.Say "Thank you for calling the ET Phone Home Service - the
          adventurous alien's first choice in intergalactic travel."
          r.Hangup
        else
          r.Redirect welcome_path
        end
      end

      render plain: response.text
    end
end