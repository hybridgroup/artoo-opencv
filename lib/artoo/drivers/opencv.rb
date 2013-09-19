require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The opencv driver behaviors
    class Opencv < Driver
      attr_accessor :image
  
      def initialize image
        @image = image
      end

      def detect_circles(lower, upper)
        tmp_image = ::OpenCV::BGR2HSV(@image)
        tmp_image = tmp_image.in_range(::OpenCV::CvScalar.new(lower[:b], lower[:g], lower[:r]), ::OpenCV::CvScalar.new(upper[:b], upper[:g], upper[:r]))
        return tmp_image.hough_circles(::OpenCV::CV_HOUGH_GRADIENT, 2.0, 10, 200, 50)
      end
      
      def draw_circles!(circles=[])
        circles.each do |circle|
          @image.circle! circle.center, circle.radius, :color => ::OpenCV::CvColor::Red, :thickness => 3
        end
      end

      def detect_faces(haar)
        ::OpenCV::CvHaarClassifierCascade::load(haar).detect_objects(@image)
      end

      def draw_rectangles!(rectangles=[])
        rectangles.each { |rect|
          @image.rectangle! rect.top_left, rect.bottom_right, :color => ::OpenCV::CvColor::Red, :thickness => 3
        }
      end

      def refresh
        connection.connect
      end
    end
  end
end
