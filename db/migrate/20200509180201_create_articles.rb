class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.boolean :read
      t.string :url
      t.bigint :flux_id
      t.string :pub
      t.timestamps
    end
  end
end
