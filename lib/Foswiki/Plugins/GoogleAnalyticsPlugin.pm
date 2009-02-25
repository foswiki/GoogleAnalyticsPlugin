package Foswiki::Plugins::GoogleAnalyticsPlugin;

use strict;

use vars qw( $VERSION $RELEASE $pluginName $debug $initialised $googleSiteKey );

# This should always be $Rev$ so that TWiki can determine the checked-in
# status of the plugin. It is used by the build automation tools, so
# you should leave it alone.
$VERSION = '$Rev$';

# This is a free-form string you can use to "name" your own plugin version.
# It is *not* used by the build automation tools, but is reported as part
# of the version number in PLUGINDESCRIPTIONS.
$RELEASE = 'Dakar';

$pluginName = 'GoogleAnalyticsPlugin';

################################################################################

sub initPlugin {
    my( $topic, $web, $user, $installWeb ) = @_;

    $debug = Foswiki::Func::getPluginPreferencesFlag( "DEBUG" );
    # Get plugin preferences, variables defined by:
    #   * Set GOOGLESITEKEY = ...
	$googleSiteKey = Foswiki::Func::getPluginPreferencesValue( "GOOGLESITEKEY" );

	_addToHead();
    return 1;
}

################################################################################

sub _addToHead {
    my $header = '<!-- Google Analytics script -->
<script type="text/javascript">
// <![CDATA[
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
    var pageTracker = _gat._getTracker("'.$googleSiteKey.'");
    pageTracker._trackPageview();
} catch(err) {}
// ]]>
</script>
';
    Foswiki::Func::addToHEAD('GOOGLEANALYTICSPLUGIN',$header)
}

################################################################################
1;
