class AddAddresses < ActiveRecord::Migration
  def change

    create_table :addresses do |t|
      t.string :pao
      t.string :sao
      t.integer :street_id
      t.integer :town_id
      t.integer :locality_id
      t.integer :postcode_id
    end

    create_table :streets do |t|
      t.string :name
      t.integer :locality_id
      t.integer :town_id
      t.belongs_to :address
      t.belongs_to :postcode
    end

    create_table :towns do |t|
      t.string :name
      t.belongs_to :address
      t.belongs_to :postcode
      t.belongs_to :street
    end

    create_table :localities do |t|
      t.string :name
      t.integer :town_id
      t.belongs_to :postcode
      t.belongs_to :street
      t.belongs_to :address
    end

    create_table :postcodes do |t|
      t.string :name
      t.integer :locality_id
      t.integer :town_id
      t.belongs_to :address
      t.belongs_to :street
    end

  end
end
