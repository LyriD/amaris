module Refinery
  module Inquiries
    class InquiriesController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def thank_you
        @page = ::Refinery::Page.find_by_link_url("/contact/thank_you")
      end

      def new
        @inquiry = ::Refinery::Inquiries::Inquiry.new
      end

      def create
        @inquiry = ::Refinery::Inquiries::Inquiry.new(params[:inquiry])
        c = params[:inquiry_attach][:file]
        unless c.blank?
          name = c.original_filename
          directory = "public/user_files"
          path = File.join(directory, name)
          File.open(path, "wb") { |f| f.write(c.read) }
          @inquiry.file_id = '/user_files/'+path.split('/').last
          @inquiry.save!
        end

        if @inquiry.save
          if @inquiry.ham? || Refinery::Inquiries.send_notifications_for_inquiries_marked_as_spam
            begin
              ::Refinery::Inquiries::InquiryMailer.notification(@inquiry, request).deliver
            rescue
              logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
            end

            begin
              ::Refinery::Inquiries::InquiryMailer.confirmation(@inquiry, request).deliver
            rescue
              logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
            end if ::Refinery::Inquiries::Setting.send_confirmation?
          end

          redirect_to '/thank_you'
        else
          render :action => 'new'
        end
      end

      protected

      def find_page
        @page = ::Refinery::Page.find_by_link_url("/contact")
      end

    end
  end
end
