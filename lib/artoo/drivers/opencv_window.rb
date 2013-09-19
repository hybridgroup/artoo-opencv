require 'artoo/drivers/driver'
require 'opencv'

module Artoo
  module Drivers
    class OpencvWindow < Driver

      COMMANDS = [:image=].freeze

      attr_accessor :image, :window

      def initialize(params={})
        super
        title = additional_params[:title] || ""
        @window = ::OpenCV::GUI::Window.new(title)
      end

      # Start driver and any required connections
      def start_driver
        begin
          every(interval) do
            show_image 
          end
          super
        rescue Exception => e
          Logger.error "Error starting Opencv driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end


      def show_image
        begin
          window.show @image if !@image.nil?
          ::OpenCV::GUI::wait_key(1)
        rescue Exception => e
          Logger.error e.message
        end
      end
    end
  end
end
