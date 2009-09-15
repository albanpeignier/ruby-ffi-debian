require "fileutils"

# Load the fresh installed ffi release

%w{rbdir sodir}.each do |config_dir|
  ffi_lib_dir = File.join(@config.install_prefix, config(config_dir))
  $: << ffi_lib_dir unless $:.include?(ffi_lib_dir)
end

require "ffi"
require "ffi/tools/types_generator"

File.open(File.join(FFI::Platform::CONF_DIR, 'types.conf'),'w') do |f|
  f.puts FFI::TypesGenerator.generate
end
