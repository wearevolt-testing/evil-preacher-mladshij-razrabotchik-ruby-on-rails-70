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

  describe :index do
    let!(:user){ create(:user) }
    let!(:posts){ create_list(:post, 4, author: user) }

    context 'unauthorized' do
      it 'return status 401' do
        get api_v1_posts_path
        expect(response.status).to eq(401)
      end
    end

    context 'authorized' do
      before do
        params = { page: 2, per_page: 2 }
        get api_v1_posts_path, params: params, headers: auth_headers(user)
      end

      it 'return status 200' do
        expect(response.status).to eq(200)
      end

      it 'returns array of posts' do
        expect(json_response).is_a?(Array)
        expect(json_response.size).to eq(2)
      end

      it 'return header values' do
        expect(response.header).to include('pages')
        expect(response.header).to include('posts')
      end
    end
  end

  describe :show do
    let!(:user){ create(:user) }
    let!(:post){ create(:post, author: user) }

    context 'authorized' do
      before do
        params = { id: post }
        get api_v1_posts_path, params: params, headers: auth_headers(user)
      end

      it 'returns 200 status code' do
        expect(response).to be_success
      end

      it 'return current post' do
        expect(json_response).to be_present
      end
    end

    context 'unauthorized' do
      before do
        params = { id: post }
        get api_v1_posts_path, params: params
      end

      it 'return status 401' do
        expect(response.status).to eq(401)
      end
    end
  end
end
