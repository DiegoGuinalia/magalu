require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  include ApiHelper

  describe '#index' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }

    describe "unauthorized" do
      it "should return an error" do
        get :index
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

  describe '#create' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }

    describe "unauthorized" do
      it "should return an error" do
        post :create, params: { name: 'new user', email: 'new_user@email.com' }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        post :create, params: { name: 'new user', email: 'new_user@email.com' }
        body = json_parse(response.body)

        expect(response.status).to be(200)
        expect(body["data"]).to eq({"email"=>"new_user@email.com", "name"=>"new user"})
      end
    end  
  end

  describe '#show' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }

    describe "unauthorized" do
      it "should return an error" do
        get :show, params: { id: user.id }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        get :show, params: { id: user.id }
        body = json_parse(response.body)

        expect(response.status).to be(200)
        expect(body["data"]).to eq({'name' => user.name, 'email' => user.email})
      end
    end  
  end

  describe '#update' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }

    describe "unauthorized" do
      it "should return an error" do
        put :update, params: { id: user.id, name: 'batata' }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        put :update, params: { id: user.id, name: 'batata' }
        body = json_parse(response.body)

        expect(response.status).to be(200)
        expect(body["data"]).to eq({'name' => 'batata', 'email' => user.email})
      end
    end  
  end

  describe '#destroy' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }

    describe "unauthorized" do
      it "should return an error" do
        delete :destroy, params: { id: user.id }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do
      let(:new_user) { create(:user) }

      before do
        authenticated_header(request, credential.api_key)
      end

      it "should return success" do
        delete :destroy, params: { id: new_user.id }

        expect(response.status).to be(204)
      end

      describe "trying to destroy current_user" do
        before do
          authenticated_header(request, credential.api_key)
        end

        it "should return error" do
          delete :destroy, params: { id: user.id }
    
          expect(response.status).to be(405)
        end
      end
    end  
  end
end

