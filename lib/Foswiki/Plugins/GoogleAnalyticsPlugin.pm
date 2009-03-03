package Foswiki::Plugins::GoogleAnalyticsPlugin;

use strict;

use vars qw( $VERSION $RELEASE $pluginName $debug );

# This should always be $Rev$ so that TWiki can determine the checked-in
# status of the plugin. It is used by the build automation tools, so
# you should leave it alone.
$VERSION = '$Rev$';

# This is a free-form string you can use to "name" your own plugin version.
# It is *not* used by the build automation tools, but is reported as part
# of the version number in PLUGINDESCRIPTIONS.
$RELEASE = '2.0.3';

our $NO_PREFS_IN_TOPIC = 1;

$pluginName = 'GoogleAnalyticsPlugin';

################################################################################

sub initPlugin {
    my( $topic, $web, $user, $installWeb ) = @_;

    return 1;
}

################################################################################
1;
