# == Class: bettertouchtool
#
# Install bettertouchtool
#
class bettertouchtool (
  $install_path = "/Users/${::boxen_user}/Applications/BetterTouchTool.app",
) {
  package { 'bettertouchtool-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  }
  -> osx_default { 'Enable launch on boot for BetterTouchTool':
    domain => 'com.hegenberg.BetterTouchTool',
    key    => 'launchOnStartup',
    value  => 1,
    type   => 'integer'
  }
  -> osx_login_item { 'BetterTouchTool':
    hidden => true,
    path   => $install_path
  }
  ~> exec { 'launch bettertouchtool':
    command     => "/usr/bin/open ${install_path}",
    refreshonly => true,
  }
}
