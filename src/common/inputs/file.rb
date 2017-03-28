module Common
  module Inputs
    class File

      attr_accessor :file

      def read(path)
        @file = ::File.open(path)
        self
      end

      def to_a
        @file.read.split("\n")
      end

    end
  end
end
