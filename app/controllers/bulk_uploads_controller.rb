class BulkUploadsController < ApplicationController

  def new
  end

  def create
    BulkUploadWorker.perform_async(params[:vendor][:thumbnails])
    flash[:success] = "Logos are uploading in background"
    redirect_to root_path
  end
end
