class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :full_name
      t.string :description
      t.boolean :private
      t.boolean :fork
      t.string :url
      t.string :html_url
      t.string :archive_url
      t.string :assignees_url
      t.string :collaborators_url
      t.string :commits_url
      t.string :contributors_url
      t.string :forks_url
      t.string :homepage

      t.timestamps null: false
    end
  end
end
