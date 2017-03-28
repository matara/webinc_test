module Common
  module Inputs
    class Stdin

      def read
        lines = []
        $stdin.each_line do |line|
          break if line == "\n"
          lines.push line.gsub("\n", '')
        end
        lines
      end

    end
  end
end
