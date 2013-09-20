require 'artoo'

connection :capture, :adaptor => :opencv_capture
device :capture, :driver => :opencv_capture, :connection => :capture, :interval => 0.01

connection :window, :adaptor => :opencv_window
device :window, :driver => :opencv_window, :connection => :window, :title => "My Window", :interval => 0.01

work do
  on capture, :frame => proc { |*value| 
    window.image = value[1].image
  }
end
