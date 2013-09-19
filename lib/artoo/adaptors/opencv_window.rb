require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a opencv device
    # @see device documentation for more information
    class OpencvWindow < Adaptor
      finalizer :finalize
      attr_reader :window

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        require 'opencv' unless defined?(::OpenCV) 
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
