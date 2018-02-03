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
    #if rectangle, swap height and width to allow input in form (x,y)
    if(@width!=@height)
      temp = @height
      @height = @width
      @width = temp
    end
    #create '2d' array with all bits set to O
    @array = Array.new(@width){Array.new(@height, "O")}
  end

  #sets the supplied bit (x,y) to the supplied char
  def set(x, y, char)
    #if supplied x,y out of bounds, raise exception
    if(x == 0 || y == 0 || x > @height || y > @width)
      raise Exception.new("Index out of bounds")
    end
      @array[y-1][x-1] = char
  end

  #sets entire grid to supplied char
  def setAll(char)
    #for each array element in outer @array
    @array.each do |element|
      #for each bit element in inner array
      element.each_with_index do |innerElement, index|
        element[index] = char
      end
    end
  end

  #sets every bit to "O"
  def clear()
    #for each array element in outer @array
    @array.each do |element|
      #for each bit element in inner array
      element.each_with_index do |innerElement, index|
        element[index] = "O"
      end
    end
  end

  #prints bitmap to terminal
  def printToTerminal
    #for each array element in outer @array
    @array.each_with_index do |element,index|
      #for each bit element in inner array
      element.each_with_index do |innerElement, innerIndex|
        #if end of row, print new line to visually represent grid
        if( innerIndex == element.size - 1)
          print innerElement + "\n"
        else
          print innerElement + " "
        end
      end
    end
  end

  #draws a horizontal segment of char between x1 and x2 inclusive
  def horizontal(y, x1, x2, char)
    #if supplied vars are out of bounds, raise exception
    if(y == 0 || x1 == 0 || x2 == 0 || y > @width || x1 > @height || x2 > @height)
      raise Exception.new("Index out of bounds")
    end
    @array[y-1].each_with_index do |element, index|
      #if only one bit selected
      if(x1 == x2 && index == x1-1)
        @array[y-1][index] = char
      end
      #if line selected
      #case: first supplied x is greater than second
      if(x1 > x2)
        if(index <= x1-1 && index >= x2-1)
          @array[y-1][index] = char
        end
      #case: second supplied x is greater than first
      else
        if(index <= x2-1 && index >= x1-1)
          @array[y-1][index] = char
        end
      end
    end
  end

  #draws a vertical segment of char between y1 and y2 inclusive
  def vertical(x, y1, y2, char)
    #if supplied vars are out of bounds, raise exception
    if(x == 0 || y1 == 0 || y2 == 0 || x > @height || y1 > @width || y2 > @width)
      raise Exception.new("Index out of bounds")
    end
    @array.each_with_index do |element, index|
      #if only one bit selected
      if(y1 == y2 && index == y1-1)
        @array[y1-1][x-1] = char
      end
      #if line selected
      #case: first supplied y is greater than second
      if(y1 > y2)
        if(index <= y1-1 && index >= y2-1)
          @array[index][x-1] = char
        end
      end
      #case: second supplied y is greater than first
      if(y1 < y2)
        if(index <= y2-1 && index >= y1-1)
          @array[index][x-1] = char
        end
      end
    end
  end



end
