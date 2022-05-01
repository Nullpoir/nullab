require 'rails_helper'

RSpec.describe "Api::Admin::Sessions", type: :request do
  let!(:administrator) do
    create :administrator, email: 'test@test.com',
                           password: 'password-1234',
                           password_confirmation: 'password-1234',
                           confirmed_at: Time.zone.now
  end
  let(:admin_token) { administrator.create_new_auth_token }
  let(:not_logged_in_headers) { { 'Host' => 'example.com' } }
  let(:logged_in_headers) { not_logged_in_headers.merge(admin_token) }
  let(:json_body) { JSON.parse(response.body) }

  describe '#create' do
    subject { post api_admin_login_path, params: params, headers: headers }

    let(:headers) { not_logged_in_headers }

    context 'ユーザーが存在しないとき' do
      let(:params) do
        {
          email: 'xxxx@test.com',
          password: 'password-1234',
        }
      end

      it 'ログインできないこと' do
        is_expected.to eq 401
      end
    end

    context 'ユーザーが存在するとき' do
      let(:params) do
        {
          email: 'test@test.com',
          password: 'password-1234',
        }
      end

      it 'ログインできること' do
        is_expected.to eq 200
      end
    end
  end

  describe '#destroy' do
    subject { delete api_admin_logout_path, params: params, headers: headers }

    let(:params) { {} }

    context '未ログインのとき' do
      let(:headers) { not_logged_in_headers }

      it 'ログアウトできないこと' do
        is_expected.to eq 404
      end
    end

    context 'ログイン済のとき' do
      let(:headers) { logged_in_headers }

      it 'ログアウトできること' do
        is_expected.to eq 200
      end
    end
  end
end
