$:.unshift << "/home/alban/share/projects/tryphon.org/rake-debian-build/lib"

require 'debian/build'
include Debian::Build

require 'debian/build/config'

namespace "package" do
  Package.new(:"libffi-ruby") do |t|
    t.version = '0.5.0+git200909101708'
    t.debian_increment = 1

    t.source_provider = DebianTarballProvider.new
  end

  namespace "libffi-ruby:source:update" do
    desc "Update source tarball with current git sources"
    task :git do
      name = "libffi-ruby"
      base_version = "0.5.0"
      version="#{base_version}+git#{Time.now.strftime('%Y%m%d%H%M')}"

      tmp_dir="/tmp/#{name}.git"
      sources_dir="#{tmp_dir}/#{name}-#{base_version}"

      rm_rf tmp_dir
      mkdir_p sources_dir

      sh "wget -O - http://github.com/ffi/ffi/tarball/master | tar -xzf - --strip 1 -C #{sources_dir}"
      sh "tar -czf '#{name}-#{version}.tgz' -C #{tmp_dir} ."
      sh "dch --newversion '#{version}-1' 'New upstream release'"
    end
  end

end


require 'debian/build/tasks'

