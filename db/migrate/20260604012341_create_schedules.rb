class CreateSchedules < ActiveRecord::Migration[8.1]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :content
      t.date :start_date
      t.date :end_date
      t.boolean :all_day, default: false

      t.timestamps
    end
  end
end
