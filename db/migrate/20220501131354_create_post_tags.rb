class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.integer :post_id, index: true, comment: '記事ID'
      t.integer :tag_id, index: true, comment: 'タグID'

      t.index [
        :post_id, :tag_id
      ], name: 'index_tag_01'
      t.timestamps
    end
  end
end
