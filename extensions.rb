module TaLibFFI::Extensions #:nodoc:
  # Sets path to libta_lib.{dylib,so}
  def library_path=(path)
    @libtidy_path = path
  end

  # Returns path to libta_lib.{dylib,so}
  def library_path
    @libtidy_path ||= find_ta
  end

  def find_ta
    fnames = ['libta_lib.dylib', 'libta_lib.so']
    pathes = []
    pathes += ENV['LD_LIBRARY_PATH'].split(':') if ENV['LD_LIBRARY_PATH']
    pathes += ENV['DYLD_LIBRARY_PATH'].split(':') if ENV['DYLD_LIBRARY_PATH']
    pathes += ENV['PATH'].split(':').reject { |a| a['sbin'] }.map { |a| a.sub('/bin', '/lib') } if ENV['PATH']
    pathes = ['/usr/lib', '/usr/local/lib'] if pathes.size == 0
    for path in pathes.uniq
      fnames.each { |fname| return File.join(path, fname) if File.exists?(File.join(path, fname)) }
    end
    nil
  end
  private :find_ta
end
TaLibFFI.extend TaLibFFI::Extensions
