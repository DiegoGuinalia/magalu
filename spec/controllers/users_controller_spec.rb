require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  include ApiHelper

  describe '#index' do
    let(:credential) { create(:credential) }
    let(:user) { credential.user }

    describe "unauthorized" do
      it "should return an error" do
        get :index, params: { }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        get :index
        body = json_parse(response.body)

        expect(response.status).to be(200)
        expect(body["entries"]).to include({'name' => user.name, 'email' => user.email})
      end
    end
    
  end
end

