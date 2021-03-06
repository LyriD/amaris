# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Vertcomm::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  "<span class='error'>#{html_tag}</span>".html_safe
end
