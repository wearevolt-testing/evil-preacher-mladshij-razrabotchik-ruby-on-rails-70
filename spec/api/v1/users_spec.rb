require 'rails_helper'

describe Api::V1::UsersController, type: :request do
  describe 'POST /create' do

    context 'with valid attributes' do
      before do
        @user = FactoryGirl.attributes_for(:user)
        params = {user: @user.as_json, format: :json}
        post api_v1_users_path, params: params
      end

      it 'responds successfully' do
        expect(response.status).to eq(201)
      end

      it 'return user attrs' do
        expect(response.body).to include_json("Khorne".to_json).at_path("nickname")
        expect(response.body).to include_json("khorne@warp.com".to_json).at_path("email")
      end
    end

    context 'with invalid attributes' do
      before do
        @user = FactoryGirl.attributes_for(:invalid_user)
        params = {user: @user.as_json, format: :json}
        post api_v1_users_path, params: params
      end

      it 'respond unsuccessfully' do
        expect(response.status).to eq(422)
      end
    end
  end
end
