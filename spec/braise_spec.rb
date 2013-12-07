require 'spec_helper'
include Braise

describe Braise do
  before(:each) do
    @@config = { :color => ANSI.white_on_red, :additional_flags => "" }
  end

  describe "braise" do
    it "should raise an exception on an inspected array" do
      arr = [1, 2]

      begin
        braise arr
      rescue Exception => e
        e.message.should eq(arr.inspect)
      end
    end
  end # end braise

  describe "craise" do
    it "should raise an exception with colorful font on an inspected array" do
      arr = [1, 2]

      begin
        craise arr
      rescue Exception => e
        e.message.should eq(ANSI.white_on_red + arr.inspect + ANSI.clear)
      end
    end

    it "should raise an exception with a green background" do
      Braise.configure({:color => ANSI.green})
      arr = [1, 2]

      begin
        craise arr
      rescue Exception => e
        e.message.should eq(ANSI.green + arr.inspect + ANSI.clear)
      end
    end
  end # end craise

  describe "configure" do
    it "should set color option" do
      # white_on_red is the default color scheme
      @@config[:color].should eq(ANSI.white_on_red)

      # example background color
      configure({:color => ANSI.on_green})
      @@config[:color].should eq(ANSI.on_green)

      # example font color
      configure({:color => ANSI.red})
      @@config[:color].should eq(ANSI.red)

      # example mixed color
      configure({:color => ANSI.black_on_yellow})
      @@config[:color].should eq(ANSI.black_on_yellow)
    end

    it "should set additional_flags option" do
      # the default additional_flags setting is empty
      @@config[:additional_flags].should be_empty

      # example background additional_flags
      configure({:additional_flags => "any other option"})
      @@config[:additional_flags].should eq("any other option")
    end

    it "should set both options at once" do
      # the default additional_flags setting is empty
      @@config[:additional_flags].should be_empty
      # white_on_red is the default color scheme
      @@config[:color].should eq(ANSI.white_on_red)

      configure({:color => ANSI.blue, :additional_flags => "any other option"})
      @@config[:color].should eq(ANSI.blue)
      @@config[:additional_flags].should eq("any other option")
    end

    it "should not set key with invalid name" do
      # the default additional_flags setting is empty
      @@config[:invalid_key].should be_nil

      configure({:invalid_key => "a string"})
      @@config[:invalid_key].should be_nil
    end
  end # end configure

  describe "stringify_options" do
    it "should convert empty hash to empty string" do
      stringify_options({}).should be_empty
    end

    it "should convert options hash to string" do
      # results should be separated by spaces
      stringify_options({:key1 => "value1", :key2 => "value2"}).should eq("value1 value2")
      stringify_options({:key1 => "value1", :key2 => "value2", :key3 => "value3"}).should eq("value1 value2 value3")
    end
  end # end stringify_options


end