self: super: {

  installApplication = 
    { name, appname ? name, version, src, description, homepage, 
      postInstall ? "", sourceRoot ? ".", ... }:
    with super; stdenv.mkDerivation {
      name = "${name}-${version}";
      version = "${version}";
      src = src;
      buildInputs = [ undmg unzip ];
      sourceRoot = sourceRoot;
      phases = [ "unpackPhase" "installPhase" ];
      installPhase = ''
      mkdir -p "$out/Applications/${appname}.app"
      cp -pR * "$out/Applications/${appname}.app"
    '' + postInstall;
      meta = with stdenv.lib; {
        description = description;
        homepage = homepage;
        platforms = platforms.darwin;
      };
    };

  Calibre = self.installApplication rec {
    name = "Calibre";
    version = "5.14.0";
    sourceRoot = "Calibre.app";
    src = super.fetchurl {
      url = "https://download.calibre-ebook.com/${version}/calibre-${version}.dmg";
      sha256 = "82fe3c269e4a126f9a7cc59dd24413b69f2448c125870072275634441c0e4073";
      # date = 2018-03-10T23:36:13-0700;
    };
    description = "Calibre is a one stop solution for all your ebook needs.";
    homepage = https://calibre-ebook.com;
    # appcast = https://github.com/kovidgoyal/calibre/releases.atom;
  };

  Slack = self.installApplication rec {
    name = "Slack";
    version = "4.16.2";
    sourceRoot = "Slack.app";
    src = super.fetchurl {
      url = "https://downloads.slack-edge.com/releases/macos/${version}/prod/x64/Slack-${version}-macOS.dmg";
      sha256 = "1chl7fksf988v1xvpvrjdqfk8v1yqaz6bhzf1zp5drv2q1q9ngld";
    };
    description = "Slack is the collaboration hub that brings the right people, information, and tools together to get work done.";
    homepage = https://slack.com;
  };

  Bitwarden = self.installApplication rec {
    name = "Bitwarden";
    version = "1.26.0";
    sourceRoot = "Bitwarden.app";
    src = super.fetchurl {
      url = "https://github.com/bitwarden/desktop/releases/download/v${version}/Bitwarden-${version}.dmg";
      sha256 = "1bnv1hx29605dnywiw9lz67qy7dm26vbc4c5zcfkxgm5ab23qa6r";
    };
    description = "Bitwarden helps you generate, save and manage your passwords safely and securely.";
    homepage = https://bitwarden.com;
  };

  Firefox = self.installApplication rec {
    name = "Firefox";
    version = "88.0.1";
    sourceRoot = "Firefox.app";
    src = super.fetchurl {
      url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-CA/Firefox%20${version}.dmg";
      sha256 = "03wch82bz5vq1g167msxhyfnl0pai14iqydcvs9jnrzyh858f9hg";
      name = "Firefox-${version}.dmg";
    };
    description = "The browser that respects your privacy";
    homepage = https://mozilla.org;
  };

  Deezer = self.installApplication rec {
    name = "Deezer";
    version = "4.32.0";
    sourceRoot = "Deezer.app";
    src = super.fetchurl {
      url = "http://cdn-content.deezer.com/builds/deezer-desktop/8cF2rAuKxLcU1oMDmCYm8Uiqe19Ql0HTySLssdzLkQ9ZWHuDTp2JBtQOvdrFzWPA/darwin/x64/${version}/DeezerDesktop_${version}.dmg";
      sha256 = "1wslgi2q4m3qj7vpqp2pzd0bh2zbgw5npid5578nyvn9qycgwq4k";
    };
    description = "A world of music in your pocket.";
    homepage = https://deezer.com;
  };

  SeafileClient = self.installApplication rec {
    name = "SeafileClient";
    version = "7.0.10";
    sourceRoot = "Seafile\ Client.app";
    src = super.fetchurl {
      url = "https://s3.eu-central-1.amazonaws.com/download.seadrive.org/seafile-client-${version}.dmg";
      sha256 = "f56c3f9d9aa3295e74ee9c08fe852f489188b14065af43f8d1f35aa9f0f53d36";
    };
    description = "Seafile is an open source enterprise file sync and share platform with high reliability and performance.";
    homepage = "https://seafile.com";
  };

  Signal = self.installApplication rec {
    name = "Signal";
    version = "5.2.1";
    sourceRoot = "Signal.app";
    src = super.fetchurl {
      url = "https://updates.signal.org/desktop/signal-desktop-mac-${version}.dmg";
      sha256 = "1ibr136gkz71vkcqyjhrg72lrhqrg29ryy48i4x647xpzcz78gxs";
    };
    description = "State-of-the-art end-to-end encryption";
    homepage = "https://www.signal.org/";
  };

  Kobo = self.installApplication rec {
    name = "Kobo";
    version = "4.24.11789";
    sourceRoot = "Kobo.app";
    src = super.fetchurl {
      url = "https://kbdownload1-a.akamaihd.net/desktop/kobodesktop/kobosetup.dmg";
      sha256 = "f61bce74a1eebbe11c8b4d709c2b1266c36d288b056620e68628b39fb5f4bb37";
    };
    description = "kobo.com eBooks and Audiobooks";
    homepage = "https://www.kobo.com";
  };

  Steam = self.installApplication rec {
    name = "Steam";
    version = "0.0.1";
    sourceRoot = "Steam.app";
    src = super.fetchurl {
      url = "https://cdn.cloudflare.steamstatic.com/client/installer/steam.dmg";
      sha256 = "dda4744327fe200e08d132ccbba9828b6bde8672080a69f69d52e72e9a6bda17";
    };
    description = "Steam is the ultimate destination for playing, discussing, and creating games.";
    homepage = "https://steampowered.com";
  };

  Discord = self.installApplication rec {
    name = "Discord";
    version = "0.0.262";
    sourceRoot = "Discord.app";
    src = super.fetchurl {
      url = "https://dl.discordapp.net/apps/osx/${version}/Discord.dmg";
      sha256 = "1afb0qj23hmhsz9jgzwaj5gqsxdwdxi8bcc656s27qhydnbxbgpn";
    };
    description = "Step up your game with a modern voice & text chat app.";
    homepage = "https://discord.com";
  };

  Remarkable = self.installApplication rec {
    name = "Remarkable";
    version = "2.7.1.162";
    sourceRoot = "Remarkable.app";
    src = super.fetchurl {
      url = "https://downloads.remarkable.com/desktop/production/mac/reMarkable-${version}.dmg";
      sha256 = "16rpjmh666mpwgm6jcm26z8dxlmncbqvy777qbpzknkx3bxnhrcq";
    };
    description = "The next-generation paper tablet.";
    homepage = "https://remarkable.com";
  };

  Tidal = self.installApplication rec {
    name = "TIDAL";
    version = "2.27.6.234";
    sourceRoot = "TIDAL.app";
    src = super.fetchurl {
      url = "https://download.tidal.com/desktop/TIDAL.dmg";
      sha256 = "0v5s6bwna2jhks4721fn1x3f6yhzgwbn5skimj8rgd4jp85i2h56";
    };
    description = "70+ million songs. Ad-free.";
    homepage = "https://tidal.com";
  };
}
