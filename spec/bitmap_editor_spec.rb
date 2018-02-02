require "spec_helper"
require "bitmap"
require "bitmap_editor"

describe BitmapEditor do

  it "outputs correct grid for (I 5 5)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_1.txt'
    }.to output("\nO O O O O\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n").to_stdout
  end

  it "outputs correct grid for (I 10 10)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_2.txt'
    }.to output("\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\nO O O O O O O O O O\n").to_stdout
  end

  it "outputs error for (I 5)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_3.txt'
    }.to output("unrecognised command 'I 10'\nNo bitmap to show\n").to_stdout
  end

  it "outputs correct grid for (I   3     3)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_4.txt'
    }.to output("\nO O O\nO O O\nO O O\n").to_stdout
  end

  it "outputs correct grid for (I 2 3)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_5.txt'
    }.to output("\nO O\nO O\nO O\n").to_stdout
  end

  it "outputs correct grid for (I 3 2)" do
    expect{
      BitmapEditor.new.run './spec/test_files/I_test_6.txt'
    }.to output("\nO O O\nO O O\n").to_stdout
  end

  it "outputs unrecognised command for ('')" do
    expect{
      BitmapEditor.new.run './spec/test_files/error_test_1.txt'
    }.to output("unrecognised command ''\n").to_stdout
  end

  it "sets top left bit(1,1) of 3x3 grid to 'X'" do
    expect{
      BitmapEditor.new.run './spec/test_files/L_test_1.txt'
    }.to output("\nX O O\nO O O\nO O O\n").to_stdout
  end

  it "sets bottom right bit(4,5) of 4x5 grid to 'T'" do
    expect{
      BitmapEditor.new.run './spec/test_files/L_test_2.txt'
    }.to output("\nO O O O\nO O O O\nO O O O\nO O O O\nO O O T\n").to_stdout
  end

  it "sets top right bit(5,1) of 5x5 grid to 'L'" do
    expect{
      BitmapEditor.new.run './spec/test_files/L_test_3.txt'
    }.to output("\nO O O O L\nO O O O O\nO O O O O\nO O O O O\nO O O O O\n").to_stdout
  end

  it "sets bottom left bit(1,3) of 4x3 grid to 'A'" do
    expect{
      BitmapEditor.new.run './spec/test_files/L_test_4.txt'
    }.to output("\nO O O O\nO O O O\nA O O O\n").to_stdout
  end

  it "sets bit(3,2) of 4x3 grid to 'M'" do
    expect{
      BitmapEditor.new.run './spec/test_files/L_test_5.txt'
    }.to output("\nO O O O\nO O M O\nO O O O\n").to_stdout
  end

  it "clears 3x3 grid" do
    expect{
      BitmapEditor.new.run './spec/test_files/C_test_1.txt'
    }.to output("\nO O O\nO O O\nO O O\n").to_stdout
  end

  it "sets horizontal line of 'H' with (H 1 1 4 H) on 4x4 grid" do
    expect{
      BitmapEditor.new.run './spec/test_files/H_test_1.txt'
    }.to output("\nH H H H\nO O O O\nO O O O\nO O O O\n").to_stdout
  end

  it "sets vertical line of 'F' with (H 3 3 4 F) on 4x4 grid" do
    expect{
      BitmapEditor.new.run './spec/test_files/V_test_1.txt'
    }.to output("\nO O O O\nO O O O\nO O F F\nO O O O\n").to_stdout
  end

  it "gives error message with file only containing 'L 1 1 T'" do
    expect{
      BitmapEditor.new.run './spec/test_files/error_test_2.txt'
    }.to output("No bitmap to set\n").to_stdout
  end

  it "gives error message with file only containing 'H 3 7 9 W'" do
    expect{
      BitmapEditor.new.run './spec/test_files/error_test_3.txt'
    }.to output("No bitmap to set horizontal segment\n").to_stdout
  end

  it "gives error message with file containing no I command" do
    expect{
      BitmapEditor.new.run './spec/test_files/error_test_4.txt'
    }.to output("No bitmap to set\nNo bitmap to set vertical segment\nNo bitmap to set horizontal segment\nNo bitmap to show\n").to_stdout
  end


end
