class RfidScansController < ApplicationController
  before_action :set_rfid_scan, only: [:show, :edit, :update, :destroy]

  # GET /rfid_scans
  # GET /rfid_scans.json
  def index
    @rfid_scans = RfidScan.all
  end

  # GET /rfid_scans/1
  # GET /rfid_scans/1.json
  def show
  end

  # GET /rfid_scans/new
  def new
    @rfid_scan = RfidScan.new
  end

  # GET /rfid_scans/1/edit
  def edit
  end

  # POST /rfid_scans
  # POST /rfid_scans.json
  def create
    @rfid_scan = RfidScan.new(rfid_scan_params)

    respond_to do |format|
      if @rfid_scan.save
        format.html { redirect_to @rfid_scan, notice: 'Rfid scan was successfully created.' }
        format.json { render :show, status: :created, location: @rfid_scan }
      else
        format.html { render :new }
        format.json { render json: @rfid_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfid_scans/1
  # PATCH/PUT /rfid_scans/1.json
  def update
    respond_to do |format|
      if @rfid_scan.update(rfid_scan_params)
        format.html { redirect_to @rfid_scan, notice: 'Rfid scan was successfully updated.' }
        format.json { render :show, status: :ok, location: @rfid_scan }
      else
        format.html { render :edit }
        format.json { render json: @rfid_scan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfid_scans/1
  # DELETE /rfid_scans/1.json
  def destroy
    @rfid_scan.destroy
    respond_to do |format|
      format.html { redirect_to rfid_scans_url, notice: 'Rfid scan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid_scan
      @rfid_scan = RfidScan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rfid_scan_params
      params.require(:rfid_scan).permit(:rfid, :scan_time, :status)
    end
end
