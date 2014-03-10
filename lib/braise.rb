require 'braise/version'
require 'ansi'

module Braise
  class Settings
    @@config = { :color => ANSI.white_on_red,
                 :additional_flags => '' }

    @@valid_config_keys = @@config.keys

    def self.get_options(opts={})
      Settings.stringify_options(@@config.merge(opts))
    end

    def self.configure(opts={})
      opts.each {|k,v| @@config[k.to_sym] = v if @@valid_config_keys.include? k.to_sym}
    end

    private

    def self.stringify_options(opts)
      return opts.values.join(' ').strip
    end
  end

  # brief raise
  def braise(obj)
    raise obj.inspect
  end

  # colorful raise
  def craise(obj, opts={})
    opts_str = Settings.get_options(opts)

    raise (opts_str + obj.inspect + ANSI.clear)
  end
end

include Braise
