require 'test_helper'

class RfidScansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rfid_scan = rfid_scans(:one)
  end

  test "should get index" do
    get rfid_scans_url
    assert_response :success
  end

  test "should get new" do
    get new_rfid_scan_url
    assert_response :success
  end

  test "should create rfid_scan" do
    assert_difference('RfidScan.count') do
      post rfid_scans_url, params: { rfid_scan: { rfid: @rfid_scan.rfid, scan_time: @rfid_scan.scan_time, status: @rfid_scan.status } }
    end

    assert_redirected_to rfid_scan_url(RfidScan.last)
  end

  test "should show rfid_scan" do
    get rfid_scan_url(@rfid_scan)
    assert_response :success
  end

  test "should get edit" do
    get edit_rfid_scan_url(@rfid_scan)
    assert_response :success
  end

  test "should update rfid_scan" do
    patch rfid_scan_url(@rfid_scan), params: { rfid_scan: { rfid: @rfid_scan.rfid, scan_time: @rfid_scan.scan_time, status: @rfid_scan.status } }
    assert_redirected_to rfid_scan_url(@rfid_scan)
  end

  test "should destroy rfid_scan" do
    assert_difference('RfidScan.count', -1) do
      delete rfid_scan_url(@rfid_scan)
    end

    assert_redirected_to rfid_scans_url
  end
end
