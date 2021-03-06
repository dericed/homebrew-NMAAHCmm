  require 'formula'

class Nmaahcmm < Formula
  homepage 'https://github.com/NMAAHC/NMAAHCmm'
  url 'https://github.com/NMAAHC/NMAAHCmm/archive/v0.0.1.zip'
  sha256 '62e1fa9e737a873e184729eea13fb55f45cf4439c9da3511e74e85c48265bd6e'
  head 'git://github.com//NMAAHC/NMAAHCmm.git'

  depends_on 'cowsay'
  depends_on 'dvdrtools'
  depends_on 'dvdauthor'
  depends_on 'exiftool'
  depends_on 'sdl'
  depends_on 'ffmpeg' => [ 'with-sdl2', 'with-freetype' ]
  depends_on 'flac'
  depends_on 'md5deep'
  depends_on 'mediaconch'
  depends_on 'mediainfo'
  depends_on 'normalize'
  depends_on 'homebrew/dupes/rsync'
  depends_on 'tree'
  depends_on 'xmlstarlet'


  def install
    bin.install "OptArgTest"
    bin.install "bash4test.sh"
    bin.install "diffFrameMD5"
    bin.install "makeDer"
    bin.install "makechecksum"
    bin.install "makeframemd5"
    bin.install "moveDPX"
    bin.install "my.sh"
    bin.install "myTest.sh"
    bin.install "rename.sh"
    bin.install "restructure"
    bin.install "temp"
    bin.install "temp.sh"
    bin.install "test"
    bin.install "testy"
    bin.install "writemetadata"
    bin.install "writemetadata.sh"
  end

  def post_install;
      system "updateplist"
  end

      def caveats; <<-EOS.undent
    If using the PREMIS DB reporting feature of mm, backup can be controlled via included plist file. Backup only needs to be activated/configured on the DB host computer. Included plist file will run daily backups at 2:00AM if activated.
    EOS
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>OnDemand</key>
        <true/>
        <key>RunAtLoad</key>
        <true/>
        <key>StartCalendarInterval</key>
        <dict>
          <key>Hour</key>
          <integer>02</integer>
          <key>Minute</key>
          <integer>00</integer>
        </dict>
        <key>ProgramArguments</key>
        <array>
            <string>#{bin}/dbbackup</string>
        </array>
        <key>WorkingDirectory</key>
        <string>#{HOMEBREW_PREFIX}</string>
      </dict>
    </plist>
    EOS
  end
end
