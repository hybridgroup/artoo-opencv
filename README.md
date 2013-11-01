# Artoo Adaptor For Opencv

This repository contains the Artoo (http://artoo.io/) adaptor for [Opencv](http://opencv.org/).

Artoo is a open source micro-framework for robotics using Ruby.

For more information abut Artoo, check out our repo at https://github.com/hybridgroup/artoo

## Installing

```
gem install artoo-opencv
```

## Using

```ruby
require 'artoo'

connection :capture, :adaptor => :opencv_capture
device :capture, :driver => :opencv_capture, :connection => :capture, :interval => 0.01

connection :window, :adaptor => :opencv_window
device :window, :driver => :opencv_window, :connection => :window, :title => "Hello", :interval => 0.01

work do
  on capture, :frame => proc { |*value| 
    window.image = value[1].image
  }
end
```

## Installing OpenCV

If you do not already have OpenCV installed, plesase consult the artoo-opencv documentation [page](http://artoo.io/documentation/platforms/opencv/)
