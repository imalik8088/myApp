class CreateAlumnis < ActiveRecord::Migration
  def self.up
    create_table :alumnis do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :street
      t.string :city
      t.string :country
      t.string :phone
      t.string :email
      t.string :hashed_password
      t.integer :graduation_year
	  t.references :school

      t.timestamps
    end
  end

  def self.down
    drop_table :alumnis
  end
end
