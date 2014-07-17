class Idea < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "80x80>" }
	# Validate content type
	validates_attachment_content_type :picture, :content_type => /\Aimage/
	# Validate filename
	validates_attachment_file_name :picture, :matches => [/png\Z/, /jpe?g\Z/]
	# Explicitly do not validate
	do_not_validate_attachment_file_type :picture
end
