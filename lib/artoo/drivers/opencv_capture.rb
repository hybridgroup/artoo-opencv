require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The opencv driver behaviors
    class OpencvCapture < Driver

      # Start driver and any required connections
      def start_driver
        begin
          every(interval) do
            handle_frame
          end
          super
        rescue Exception => e
          Logger.error "Error starting Opencv driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def handle_frame
        frame = connection.capture.query
        publish(event_topic_name("frame"), frame) if !frame.nil?
      end

    end
  end
end
