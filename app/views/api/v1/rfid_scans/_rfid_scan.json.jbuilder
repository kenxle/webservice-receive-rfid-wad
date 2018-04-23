json.extract! rfid_scan, :id, :rfid, :scan_time, :status, :created_at, :updated_at
json.url rfid_scan_url(rfid_scan, format: :json)
