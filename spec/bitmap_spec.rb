require "spec_helper"
require "BitMap"

describe BitMap do

  it "is 3x3" do
    bitmap = BitMap.new(3,3)
    expect(bitmap.array.size).to eq(3)
    expect(bitmap.array[0].size).to eq(3)
    expect(bitmap.array[2].size).to eq(3)
  end

  it "is 250x250" do
    bitmap = BitMap.new(250,250)
    expect(bitmap.array.size).to eq(250)
    expect(bitmap.array[0].size).to eq(250)
    expect(bitmap.array[249].size).to eq(250)
  end

  it "setsAll 20x20 to X" do
    bitmap = BitMap.new(20,20)
    bitmap.setAll("X")
    expect(bitmap.array).to eq(Array.new(20, Array.new(20, "X")))
  end

  it "clears 5x5 grid" do
    bitmap = BitMap.new(5,5)
    bitmap.setAll("X")
    bitmap.clear
    expect(bitmap.array).to eq(Array.new(5, Array.new(5, "O")))
  end

  it "clears 200x200 grid" do
    bitmap = BitMap.new(200,200)
    bitmap.setAll("X")
    bitmap.clear
    expect(bitmap.array).to eq(Array.new(200, Array.new(200, "O")))
  end

  #top left
  it "sets (1,1) of 3x3 grid to C" do
    bitmap = BitMap.new(3,3)
    bitmap.set(1,1, "C")
    temp = Array.new(3){Array.new(3, "O")}
    temp[0][0] = "C"
    expect(bitmap.array).to eq(temp)
  end

  #bottom right
  it "sets (3,3) of 3x3 grid to C" do
    bitmap = BitMap.new(3,3)
    bitmap.set(3,3, "C")
    temp = Array.new(3){Array.new(3, "O")}
    temp[2][2] = "C"
    expect(bitmap.array).to eq(temp)
  end

  #middle
  it "sets (56,67) of 100x100 grid to C" do
    bitmap = BitMap.new(100,100)
    bitmap.set(56,67, "C")
    temp = Array.new(100){Array.new(100, "O")}
    #x and y are reversed to allow input in the form (x,y)
    temp[66][55] = "C"
    expect(bitmap.array).to eq(temp)
  end

  #bottom right
  it "sets (117,117) of 117x117 grid to C" do
    bitmap = BitMap.new(117,117)
    bitmap.set(117,117, "C")
    temp = Array.new(117){Array.new(117, "O")}
    #x and y are reversed to allow input in the form (x,y)
    temp[116][116] = "C"
    expect(bitmap.array).to eq(temp)
  end

  #bottom left
  it "sets (1,136) of 136x136 grid to C" do
    bitmap = BitMap.new(136,136)
    bitmap.set(1,136, "C")
    temp = Array.new(136){Array.new(136, "O")}
    #x and y are reversed to allow input in the form (x,y)
    #indexes should be input as 1 less than req bitmap coordinates
    temp[135][0] = "C"
    expect(bitmap.array).to eq(temp)
  end

  #top right
  it "sets (29,0) of 29x29 grid to C" do
    bitmap = BitMap.new(29,29)
    bitmap.set(29,1, "C")
    temp = Array.new(29){Array.new(29, "O")}
    #x and y are reversed to allow input in the form (x,y)
    temp[0][28] = "C"
    expect(bitmap.array).to eq(temp)
  end

  it "sets top row to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(1,1,10,"X")
    temp = [["X","X","X","X","X","X","X","X","X","X",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets top row (3 to 9) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(1,3,9,"X")
    temp = [["O","O","X","X","X","X","X","X","X","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets top row (9 to 3) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(1,9,3,"X")
    temp = [["O","O","X","X","X","X","X","X","X","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets top row (1) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(1,1,1,"X")
    temp = [["X","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets bottom row to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(10,1,10,"X")
    temp = [["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["X","X","X","X","X","X","X","X","X","X",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets bottom row (5 to 10) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(10,5,10,"X")
    temp = [["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","X","X","X","X","X","X",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets bottom row (10 to 5) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(10,5,10,"X")
    temp = [["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","X","X","X","X","X","X",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets bottom row (9) to x" do
    bitmap = BitMap.new(10,10)
    bitmap.horizontal(10,9,9,"X")
    temp = [["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O","O","X","O",],]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets leftmost row to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(1,1,7,"X")
    temp = [["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets leftmost row (1 to 6) to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(1,1,6,"X")
    temp = [["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets leftmost row (6 to 1) to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(1,6,1,"X")
    temp = [["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets leftmost row (4) to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(1,4,4,"X")
    temp = [["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["X","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets rightmost row to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(7,1,7,"X")
    temp = [["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets rightmost row (3-5) to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(7,3,5,"X")
    temp = [["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets rightmost row (5 to 3) to x" do
    bitmap = BitMap.new(7,7)
    bitmap.vertical(7,5,3,"X")
    temp = [["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","X",],
            ["O","O","O","O","O","O","O",],
            ["O","O","O","O","O","O","O",]]
    #x and y reversed
    #subtract 1 from x and y when writing here
    expect(bitmap.array).to eq(temp)
  end

  it "sets all outer bits to X" do
    bitmap = BitMap.new(11,11)
    bitmap.vertical(11,1,11, "X")
    bitmap.vertical(1,11,1, "X")
    bitmap.horizontal(1,11,1, "X")
    bitmap.horizontal(11,1,11, "X")
    temp = [["X","X","X","X","X","X","X","X","X","X","X"],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","O","O","O","O","O","O","O","O","O","X",],
            ["X","X","X","X","X","X","X","X","X","X","X",]]
    expect(bitmap.array).to eq(temp)
  end

  

end
