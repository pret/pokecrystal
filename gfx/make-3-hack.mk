# This is a terrible hack to support GNU make versions lower or equal to 3.81.
# We need to support this version because it's the default in Mac OSX and Ubuntu 14.04,
# both of which are currently tested in our Travis CI.

# The issue is roughly that in this version, due to some circumstances I don't
# fully understand, make will erroneously detect a circular dependency,
# and break the build by trying to remove it.
# Related bug report: https://savannah.gnu.org/bugs/?13529
#   (the attatched patch fixes this behaviour)

# This file is an isolated "fix", which tries to break this dependency loop.
# It seems to work for the current set of rules at the time of writing,
# but I can't guarantee it'll work for everything.

$(foreach p,$(patsubst $(dir_source)/%/,%,$(wildcard $(dir_source)/gfx/pokemon/*/)),\
	$(eval $p/front.dimensions: $p/front.png))
