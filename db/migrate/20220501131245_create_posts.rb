class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, comment: '記事タイトル'
      t.integer :author_id, index: true, comment: '執筆者ID'
      t.text :content, comment: '記事本文'
      t.datetime :published_at, null: true, commnet: '公開日'
      t.integer :status, default: 0, commnet: 'ステータス(0:公開, 1:非公開)'
      t.boolean :allow_comment, default: true, comment: 'コメント許可'
      t.boolean :linkage_twitter, default: true, comment: 'Twitter同時投稿'
      t.timestamps
    end
  end
end
