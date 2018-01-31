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

end
