require 'rails_helper'

describe Api::V1::PostsController, type: :request do

  describe :create do
    let!(:user){ create(:user) }

    context 'authorized' do

      context 'with valid attributes' do
        before do
          @post = FactoryGirl.attributes_for(:post)
          params = {post: @post.as_json, format: :json}
          post api_v1_posts_path, params: params, headers: auth_headers(user)
        end

        it 'responds successfully' do
          expect(response.status).to eq(201)
        end

        it 'return post attrs' do
          expect(response.body).to include_json("MyTitle".to_json).at_path("title")
          expect(response.body).to include_json("MyBody".to_json).at_path("body")
        end
      end

      context 'with invalid attributes' do
        before do
          @post = FactoryGirl.attributes_for(:invalid_post)
          params = {post: @post.as_json, format: :json}
          post api_v1_posts_path, params: params, headers: auth_headers(user)
        end

        it 'respond unsuccessfully' do
          expect(response.status).to eq(422)
        end
      end
    end

    context 'unauthorized' do
      before do
        @post = FactoryGirl.attributes_for(:post)
        params = {post: @post.as_json, format: :json}
        post api_v1_posts_path, params: params
      end

      it 'returns status 401' do
        expect(response.status).to eq(401)
      end
    end
  end
end
