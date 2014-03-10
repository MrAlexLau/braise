require 'spec_helper'
include Braise

describe Braise do
  before(:each) do
    @@config = { :color => ANSI.white_on_red, :additional_flags => "" }
  end

  describe 'braise' do
    it 'should raise an exception on an inspected array' do
      arr = [1, 2]

      begin
        braise arr
      rescue Exception => e
        e.message.should eq(arr.inspect)
      end
    end
  end # end braise

  describe 'craise' do
    it 'should raise an exception with colorful font on an inspected array' do
      arr = [1, 2]

      begin
        craise arr
      rescue Exception => e
        e.message.should eq(ANSI.white_on_red + arr.inspect + ANSI.clear)
      end
    end

    it 'should raise an exception with a green background' do
      Braise::Settings.configure({:color => ANSI.green})
      arr = [1, 2]

      begin
        craise arr
      rescue Exception => e
        e.message.should eq(ANSI.green + arr.inspect + ANSI.clear)
      end
    end
  end # end craise


  describe 'Settings' do
    describe 'configure' do
      it 'should set color option' do
        # white_on_red is the default color scheme
        Braise::Settings.get_options().should eq(ANSI.white_on_red)

        # example background color
        Braise::Settings.configure({:color => ANSI.on_green})
        Braise::Settings.get_options().should eq(ANSI.on_green)

        # example font color
        Braise::Settings.configure({:color => ANSI.red})
        Braise::Settings.get_options().should eq(ANSI.red)

        # example mixed color
        Braise::Settings.configure({:color => ANSI.black_on_yellow})
        Braise::Settings.get_options().should eq(ANSI.black_on_yellow)
      end

      it 'should set additional_flags option' do
        opts_before = Braise::Settings.get_options()
        additional_opts = 'any other option'

        # example background additional_flags
        Braise::Settings.configure({:additional_flags => additional_opts})
        Braise::Settings.get_options().should eq("#{opts_before} #{additional_opts}")
      end

      it 'should set both options at once' do
        additional_opts = 'any other option'

        Braise::Settings.get_options().should_not eq("#{ANSI.blue} #{additional_opts}")
        Braise::Settings.configure({:color => ANSI.blue, :additional_flags => additional_opts})
        Braise::Settings.get_options().should eq("#{ANSI.blue} #{additional_opts}")
      end

      it 'should not set key with invalid name' do
        invalid_string = 'a string'
        opts_before = Braise::Settings.get_options()

        Braise::Settings.configure({:invalid_key => invalid_string})
        Braise::Settings.get_options().index(invalid_string).should be_nil
      end
    end # end configure

    describe 'stringify_options' do
      it 'should convert empty hash to empty string' do
        Braise::Settings.stringify_options({}).should be_empty
      end

      it 'should convert options hash to string' do
        # results should be separated by spaces
        Braise::Settings.stringify_options({:key1 => 'value1', :key2 => 'value2'}).should eq('value1 value2')
        Braise::Settings.stringify_options({:key1 => 'value1', :key2 => 'value2', :key3 => 'value3'}).should eq('value1 value2 value3')
      end
    end # end stringify_options
  end # end Settings


end
