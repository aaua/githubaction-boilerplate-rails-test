require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe 'get #index' do
    subject { get '/' }

    context do
      it 'リクエストが成功すること' do
        subject
        expect(response.status).to eq(200)
        expect(response.body).to include 'TOP'
      end
    end
  end
end
