require 'rails_helper'

describe 'IVR', type: :request do
  describe 'a new IVR session' do
    before(:each) { get '/' }

    it { expect(response).to have_http_status :ok }
  end

  describe 'after a selection has been made' do
    let(:digits) { rand(1) }
    before(:each) { post '/selection', params: { :Digits => digits } }

    it { expect(response).to have_http_status :ok }

    it 'should include the selected number' do
      expect(response.body.include? digits.to_s).to be true
    end
  end
end