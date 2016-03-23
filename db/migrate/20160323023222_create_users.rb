class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :avatar_url
      t.string :url
      t.string :html_url
      t.string :repos_url
      t.string :type

      t.timestamps null: false
    end
  end
end
