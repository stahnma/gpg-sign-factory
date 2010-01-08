#!/usr/bin/env ruby

require 'test/unit'
require 'pkg'


class TC_Pkg_init < Test::Unit::TestCase
      def test_path_good
        Pkg.new('fixture/python-pygooglechart-0.2.1-3.noarch.rpm')
      end

      def test_path_bad
        assert_raise Errno::ENOENT do 
          Pkg.new('fixture/python-pygooglechart-0.2.1-3333.noarch.rpm')
        end
      end
      
      def test_pkg_not_rpm
        assert_raise TypeError do 
          Pkg.new('/etc/passwd')
        end
      end
end

class TC_Pkg_pkgName < Test::Unit::TestCase
  def setup
    @pkg = Pkg.new('fixture/python-pygooglechart-0.2.1-3.noarch.rpm')
  end

  def test_name_good
    assert(@pkg.name == 'python-pygooglechart')
  end

  def test_name_bad
    assert(@pkg.name != 'timmy')
  end

  def test_pkg_has_keyid
     assert(@pkg.keyid == "b6f8c6bf")
  end
  
  def test_pkg_blank_keyid
     assert(@pkg.keyid != "blahblah")
  end

  def test_unsigned_package
     @pkg = Pkg.new("fixture/jabberpy-0.5-0.15.noarch.rpm")
     assert(@pkg.keyid == nil)
  end
end
