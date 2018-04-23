module Api
  module V1
    class ApiController < ApplicationController
      # include ::ActionController::Serialization

      # include Concerns::Authenticator
      # include Concerns::ErrorHandler
      # include Concerns::VersionExpirationHandler
      # include Concerns::Internationalizator
    end
  end
end

# class Api::V1::BaseController < ActionController::API
#   # def show
#   #   user = User.find(params[:id])

#   #   render jsonapi: user, serializer: Api::V1::UserSerializer
#   # end

#   # POST /rfid_scans
#   # POST /rfid_scans.json
#   def create
#     @rfid_scan = RfidScan.new(rfid_scan_params)

#     respond_to do |format|
#       if @rfid_scan.save

#         format.json { render :show, status: :created, location: @rfid_scan }
#       else
#         format.json { render json: @rfid_scan.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# end