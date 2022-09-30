require 'rails_helper'

RSpec.describe "Api::PostsController", type: :request do
  let(:json_body) { JSON.parse(response.body) }
  let!(:administrator) { create :administrator }
  subject { get api_posts_path, params: params }
  context '公開記事が11件ある時' do
    let!(:published_posts) { create_list :post, 11, status: :published, published_at: Time.now, author_id: administrator.id }
    context 'page=1のとき' do
      let!(:params) { { page: 1 } }
      it '記事が10件返ること' do
        subject

        expect(json_body.size).to eq 10
      end
    end
    context 'page=2のとき' do
      let!(:params) { { page: 2 } }
      it '記事が1件返ること' do
        subject

        expect(json_body.size).to eq 1
      end
    end
  end
  context '公開済みかどうかの判別ロジックについて' do
    let!(:published_posts) { create_list :post, 5, status: :published, published_at: Time.now, author_id: administrator.id }
    let!(:unpublished_posts_by_status) { create_list :post, 4, status: :not_published, published_at: Time.now, author_id: administrator.id }
    let!(:unpublished_posts_by_date) { create_list :post, 3, status: :published, published_at: Time.now + 1.day, author_id: administrator.id }

    context '公開済みの記事について' do
      let!(:params) { { page: 1 } }
      it '正常に取得可能であること' do
        subject

        expect(json_body.pluck('id')).to eq published_posts.pluck(:id)
      end
    end
  end
end
