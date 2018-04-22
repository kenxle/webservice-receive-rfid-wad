require "application_system_test_case"

class RfidScansTest < ApplicationSystemTestCase
  setup do
    @rfid_scan = rfid_scans(:one)
  end

  test "visiting the index" do
    visit rfid_scans_url
    assert_selector "h1", text: "Rfid Scans"
  end

  test "creating a Rfid scan" do
    visit rfid_scans_url
    click_on "New Rfid Scan"

    fill_in "Rfid", with: @rfid_scan.rfid
    fill_in "Scan Time", with: @rfid_scan.scan_time
    fill_in "Status", with: @rfid_scan.status
    click_on "Create Rfid scan"

    assert_text "Rfid scan was successfully created"
    click_on "Back"
  end

  test "updating a Rfid scan" do
    visit rfid_scans_url
    click_on "Edit", match: :first

    fill_in "Rfid", with: @rfid_scan.rfid
    fill_in "Scan Time", with: @rfid_scan.scan_time
    fill_in "Status", with: @rfid_scan.status
    click_on "Update Rfid scan"

    assert_text "Rfid scan was successfully updated"
    click_on "Back"
  end

  test "destroying a Rfid scan" do
    visit rfid_scans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rfid scan was successfully destroyed"
  end
end
