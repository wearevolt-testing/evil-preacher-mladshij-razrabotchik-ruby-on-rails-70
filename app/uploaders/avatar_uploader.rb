class AvatarUploader < CarrierWave::Uploader::Base

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
    process resize_to_fit: [300, 300]
  end

  def size_range
    1..3.megabytes
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
