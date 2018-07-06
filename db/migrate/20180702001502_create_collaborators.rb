class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
      t.references :wikis
      t.references :users

      t.timestamps
    end
  end
end
