require "braise/version"
require "ansi"

module Braise
  @@config = { :color => ANSI.white_on_red,
               :additional_flags => "" }

  @@valid_config_keys = @@config.keys

  def braise(obj, opts={})
    opts_str = stringify_options(@@config.merge(opts))

    raise (opts_str + obj.inspect + ANSI.clear)
  end

  def configure(opts={})
    opts.each {|k,v| @@config[k.to_sym] = v if @@valid_config_keys.include? k.to_sym}
  end

  private 

  def stringify_options(opts_hash)
    return opts_hash.inject(""){|result, pair| result.to_s + " " + pair[1].to_s}.strip
  end

end
