class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.string :date
      t.boolean :read, :default => false
      t.string :url
      t.bigint :flux_id
    end
  end
end
