class CreatePoems < ActiveRecord::Migration
  def up
    create_table :poems do |h|
      h.string :username
      h.string :text

      h.timestamps
    end
  end

  def down
    drop_table :poems
  end
end
