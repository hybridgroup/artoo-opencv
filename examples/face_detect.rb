require 'artoo'

connection :capture, :adaptor => :opencv_capture
device :capture, :driver => :opencv_capture, :connection => :capture, :interval => 0.01

connection :video, :adaptor => :opencv_window, :title => "Video"
device :video, :driver => :opencv_window, :connection => :video, :interval => 0.01

work do
  haar = "#{Dir.pwd}/examples/haarcascade_frontalface_alt.xml"
  on capture, :frame => proc { |*value| 
    begin
      opencv = value[1]
      faces = opencv.detect_faces(haar)
      opencv.draw_rectangles!(faces)
      video.image = opencv.image
    rescue Exception => e
      puts e.message
    end
  }
end
