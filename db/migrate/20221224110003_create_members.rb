class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.string :email
      t.string :academic_status
      t.string :institution
      t.text :report_title
      t.string :code

      t.timestamps
    end
  end
end
