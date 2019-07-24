class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :avatar do
    resize_to_fit 100, 100
  end

  version :cropped do
    cloudinary_transformation width: 600, height: 600,
    crop: :limit
  end
end