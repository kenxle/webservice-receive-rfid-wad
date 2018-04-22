class CreateRfidScans < ActiveRecord::Migration[5.2]
  def change
    create_table :rfid_scans do |t|
      t.string :rfid
      t.datetime :scan_time
      t.string :status

      t.timestamps
    end
  end
end
