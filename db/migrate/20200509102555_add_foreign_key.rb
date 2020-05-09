class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :articles, :fluxes
  end
end
