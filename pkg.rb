#!/usr/bin/env ruby



class Pkg
  attr_accessor :name, :keyid
  def initialize(path)
    begin 
      File.stat(path)    
    rescue Errno::ENOENT 
      raise Errno::ENOENT, "Package specified does not exist."
    end 
    @mimetype = `file -b #{path}`.gsub(/\n/,"")
    if @mimetype !~ /RPM/ # and @mimetype !~ /deb/ 
     raise  TypeError, "Package does appear to be an rpm package."
    end
    @name = pkgName(path)
    @keyid = pkgKeyID(path)
  end

  def pkgName(path)
    `rpm -qp --qf '%{name}' #{path} 2> /dev/null` 
  end

  def pkgKeyID(path)
    tmp  = `rpm -K #{path}`
    parts = tmp.split('#')
    return nil if parts.length <= 1 
    parts[-1].gsub!(')', "").strip!
  end
end
