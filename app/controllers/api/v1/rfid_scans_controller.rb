module Api
  module V1
    class RfidScansController < ApiController
    skip_before_action :verify_authenticity_token #obviously not a good pattern. fine for the prototype
    # GET /rfid_scans/new
    def new
      @rfid_scan = RfidScan.new
    end

    # POST /rfid_scans
    # POST /rfid_scans.json
    def create
      @rfid_scan = RfidScan.new(rfid_scan_params)

      respond_to do |format|
        if @rfid_scan.save
          # format.html { redirect_to @rfid_scan, notice: 'Rfid scan was successfully created.' }
          format.json { render :show, status: :created, location: @rfid_scan }
        else
          # format.html { render :new }
          format.json { render json: @rfid_scan.errors, status: :unprocessable_entity }
        end
      end
    end

    # ///
    #   def index
    #     render json: current_user.notes.all
    #   end

    #   def show
    #     render json: current_user.notes.find(params[:id])
    #   end

    #   def create
    #     note = current_user.notes.new(note_params)
    #     if note.save
    #       render json: note, status: :created
    #     else
    #       render_error(note.errors.full_messages[0], :unprocessable_entity)
    #     end
    #   end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_rfid_scan
        @rfid_scan = RfidScan.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def rfid_scan_params
        params.permit(:rfid, :scan_time, :status)
      end
    end
  end
end
