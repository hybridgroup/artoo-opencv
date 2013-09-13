require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a opencv device
    # @see device documentation for more information
    class OpencvCapture < Adaptor
      finalizer :finalize
      attr_reader :capture

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        require 'opencv' unless defined?(::OpenCV) 
        source = port.port
        if source.to_s.empty? || source == "none"
          @capture = ::OpenCV::CvCapture::open
        else
          @capture = ::OpenCV::CvCapture::open source
        end
        super
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        super
      end

      # Uses method missing to call device actions
      # @see device documentation
      def method_missing(method_name, *arguments, &block)
        device.send(method_name, *arguments, &block)
      end
    end
  end
end
