module OSC::Type
  extend self

  class Blob
  end

  class Time
    @time : Float64
  end

  class RGB
    getter r : UInt8
    getter g : UInt8
    getter b : UInt8

    def initialize(@r, @g, @b)
    end
  end

  class Midi
    getter port : UInt8
    getter status : UInt8
    getter data1 : UInt8
    getter data2 : UInt8

    def initialize(@port, @status, @data1, @data2)
    end
  end

  class True
    def value
      true
    end
  end

  class False
    def value
      false
    end
  end

  class Inf
  end

  @@TypeTag = {'i' => Int32,
               'f' => Float32,
               's' => String,
               'S' => String,
               'b' => OSC::Type::Blob,
               'h' => Int64,
               't' => OSC::Type::Time,
               'd' => Float64,
               'c' => Char,
               'r' => OSC::Type::RGB,
               'm' => OSC::Type::Midi,
               'T' => OSC::Type::True,
               'F' => OSC::Type::False,
               'N' => Nil,
               'I' => OSC::Type::Inf,
  }

  def type(t : Char)
    @@TypeTag[t]
  end
end
