class CreateNewsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :news_items do |t|
      t.string   :title
      t.string   :description
      t.datetime :expire_at

      t.timestamps
    end
  end
end
