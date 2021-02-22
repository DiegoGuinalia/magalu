require 'rails_helper'

RSpec.describe Api::V1::FavoritedProductsController, type: :controller do
  include ApiHelper

  describe '#add_to_fav_list' do
    let(:user) { create(:user) }
    let(:credential) { user.credential }
    let (:request_params) { 
      {
        name: 'novo',
        brand: 'produto',
        image: 'www.batata.com/imagem',
        external_id: 'ed710aa4-74e0-11eb-9439-0242ac130002',
        title: 'titulo',
        price: '1000'
      }
    }

    describe "unauthorized" do
      it "should return an error" do
        post :add_to_fav_list, params: request_params
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        post :add_to_fav_list, params: request_params
        body = json_parse(response.body)

        expect(response.status).to be(200)
      end
    end  
  end

  describe '#show' do
    let(:favorite_list) { create(:favorite_list) }
    let(:user) { favorite_list.user }
    let(:credential) { user.credential }
    

    describe "unauthorized" do
      it "should return an error" do
        get :show, params: { id: favorite_list.id }
        expect(response.status).to be(401)
      end
    end

    describe "authorized" do

    before do
      authenticated_header(request, credential.api_key)
    end

      it "should return success" do
        get :show, params: { id: favorite_list.id }
        body = json_parse(response.body)

        expect(response.status).to be(200)
      end
    end  
  end
end

