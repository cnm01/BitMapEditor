#BitMap
class BitMap

  #instance variables
  #@width - integer representing the number of inner arrays
  #@height - integer representing the number of elements in each inner array
  #@array - an array of arrays, with each inner array containing a number of string characters
  attr_accessor :array

  #first position in grid is 1,1

  #constructor - creates new grid with all bits set to "O"
  def initialize(width, height)
    @width = width
    @height = height
    @array = Array.new(@width){Array.new(@height, "O")}
  end

  #sets bit (x,y) to supplied char
  def set(x, y, char)
    array[y-1][x-1] = char
  end

  #sets entire grid to char
  def setAll(char)
    @array.each do |element|
      #for each element in inner array
      element.each_with_index do |innerElement, index|
        element[index] = char
      end
    end
  end

  #sets every bit to "O"
  def clear()
    #for each array in outer array
    @array.each do |element|
      #for each element in inner array
      element.each_with_index do |innerElement, index|
        element[index] = "O"
      end
    end
  end

  #prints bitmap to terminal
  def printToTerminal
    @array.each_with_index do |element,index|
      element.each_with_index do |innerElement, innerIndex|
        if( innerIndex == element.size - 1)
          print innerElement
          print "\n"
        else
          print innerElement + " "
        end
      end
    end
  end




end



map = BitMap.new(30,30)
map.printToTerminal
