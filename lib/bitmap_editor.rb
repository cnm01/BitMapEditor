require './lib/bitmap'

class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      array = line.split
      case line

      #I N M : create new M x N image with all pixels coloured white (O)
      when /I\s+\d+\s+\d+/
          @bitmap = BitMap.new(Integer(array[1]),Integer(array[2]))

      #C : clears the table, setting all pixels to white (O)
      when /C/
          if @bitmap.nil?
            puts "No bitmap to clear"
          else
            @bitmap.clear
          end

      #L X Y C :colours the pixel (X,Y) with colour C
      when /L\s+\d+\s+\d+\s+[a-zA-Z]/
          if @bitmap.nil?
            puts "No bitmap to set"
          else
            @bitmap.set(Integer(array[1]), Integer(array[2]), array[3])
          end

      #V X Y1 Y2 C - draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)
      when /V\s+\d+\s+\d+\s+\d+\s+[a-zA-Z]/
          if @bitmap.nil?
            puts "No bitmap to set vertical segment"
          else
            @bitmap.vertical(Integer(array[1]), Integer(array[2]), Integer(array[3]), array[4])
          end

      #H X1 X2 Y C - draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive)
      when /H\s+\d+\s+\d+\s+\d+\s+[a-zA-Z]/
          if @bitmap.nil?
            puts "No bitmap to set horizontal segment"
          else
            @bitmap.horizontal(Integer(array[1]), Integer(array[2]), Integer(array[3]), array[4])
          end

      #S - Show the contents of the current image
      when /S/
          if @bitmap.nil?
            puts "No bitmap to show"
          else
            puts ""
            @bitmap.printToTerminal
          end

      else
          puts "unrecognised command '" + line + "'"
      end
    end
  end

end
