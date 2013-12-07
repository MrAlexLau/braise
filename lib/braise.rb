require "braise/version"
require "ansi"

module Braise
  @@config = { :color => ANSI.white_on_red,
               :additional_flags => "" }

  @@valid_config_keys = @@config.keys

  # brief raise
  def braise(obj)
    raise obj.inspect
  end

  # colorful raise
  def craise(obj, opts={})
    opts_str = stringify_options(@@config.merge(opts))

    raise (opts_str + obj.inspect + ANSI.clear)
  end

  def configure(opts={})
    opts.each {|k,v| @@config[k.to_sym] = v if @@valid_config_keys.include? k.to_sym}
  end

  private 

  def stringify_options(opts_hash)
    return opts_hash.values.join(" ").strip
  end

end
