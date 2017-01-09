class ChangeColumnName < ActiveRecord::Migration
  change_table :comments do |t|
    t.rename :title, :name
  end
end
