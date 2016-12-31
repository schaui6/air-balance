class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|

      # header
      t.string :date

      # kitchen hood data
      t.string :manufacturer
      t.string :model
      t.string :hood_size
      t.string :location

      # exhaust section
      t.integer :e1, :default => 0
      t.integer :e2, :default => 0
      t.integer :e3, :default => 0
      t.integer :e4, :default => 0
      t.integer :e5, :default => 0
      t.integer :e6, :default => 0
      t.integer :e7, :default => 0
      t.integer :e8, :default => 0
      t.integer :e9, :default => 0
      t.integer :e10, :default => 0
      t.integer :e11, :default => 0
      t.integer :e12, :default => 0
      t.integer :e13, :default => 0
      t.integer :e14, :default => 0
      t.integer :e15, :default => 0
      t.integer :total_exhaust_cfm
      t.float :exhaust_test_velocities
      t.float :exhaust_filter_size_1
      t.float :exhaust_filter_size_2
      t.string :exhaust_filter_manufacturer
      t.float :exhaust_average_velocity
      t.float :exhaust_filter_area
      t.float :exhaust_filter_factor
      t.integer :number_of_exhaust_filters

      t.string :remarks
      t.float :duct_size_1
      t.float :duct_size_2

      # supply section
      t.integer :number_of_supply_inputs
      t.integer :s1, :default => 0
      t.integer :s2, :default => 0
      t.integer :s3, :default => 0
      t.integer :s4, :default => 0
      t.integer :s5, :default => 0
      t.integer :s6, :default => 0
      t.integer :s7, :default => 0
      t.integer :s8, :default => 0
      t.integer :s9, :default => 0
      t.integer :s10, :default => 0
      t.integer :total_supply_cfm
      t.float :supply_test_velocities
      t.float :supply_filter_size_1
      t.float :supply_filter_size_2
      t.string :supply_filter_manufacturer
      t.float :supply_average_velocity
      t.float :supply_opening_area
      t.float :supply_area_factor

      t.integer :exhaust_design_data
      t.integer :make_up_design_data
      t.integer :percentage

      # business info
      t.string :title
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip


      t.timestamps
    end
  end
end
