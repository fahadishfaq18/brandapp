class BulkUploadWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(thumbnails)
  	thumbnails.each do |img|
      filename = img.original_filename.split('.')[0]
      vendor = Vendor.find_by(name: filename)
      if vendor.present?
        vendor.logo.attach(img)
      end
    end  
 	end
end