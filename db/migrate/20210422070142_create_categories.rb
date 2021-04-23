class CreateCategories < ActiveRecord::Migration[6.1]
  def self.up

    create_table :categories do |t|
      t.string :name
    end

    Category.create :name => "COOLERS"
    Category.create :name => "ICE TEA"
    Category.create :name => "SHAKES"
    Category.create :name => "COFFEE"
    Category.create :name => "TEA"
    Category.create :name => "FRIES"
    Category.create :name => "SANDWICHES"
    Category.create :name => "BURGERS"
    Category.create :name => "DESSERTS"

  end

  def self.down
    drop_table :categories
  end
end
